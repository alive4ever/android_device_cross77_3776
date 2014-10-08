# Information about initramfs used in this kernel.

## Splitting the boot image

To split iniramfs from the kernel, you need an utility such as
`abootimg` or `unmkbootimg` or `split_boot`. I recommend using
`abootimg` since it's available in the Debian and Ubuntu package
repository. In addition to those programs, you can use `unpackbootimg`
program generated from CyanogenMod source with `make otatools`.

To split boot image, use the following commands. I assume the boot image
filename is `boot.img` and it's located in the current working
directory.

```
mkdir boot
cd boot
abootimg -x ../boot.img
```

## Extracting and modifying the initramfs.

The first 512 bytes needs to be skipped, so that gzip recognizes the
format and able to extract the initrd.img file.

```
dd if=initrd.img bs=1 skip=512 of=initrd.cpio.gz
```

The 512 bytes header can be extracted from initrd.img using the
following command.

```
dd if=initrd.img bs=1 count=512 of=initrd.headers
```

Decompress the initrd.cpio.gz file using GNU gzip or Busybox gzip.
```
gunzip initrd.cpio.gz
```

This will delete `initrd.cpio.gz` and create an uncompressed cpio archive
`initrd.cpio`.
Use the cpio utility to extract the initrd.cpio archive.

With GNU cpio
```
mkdir initrd
cd initrd
cpio -ivd < ../initrd.cpio
```
With Busybox cpio
```
busybox cpio -ivd < ../initrd.cpio
```

The cpio archive will be extracted in the current working directory.
Make any necessary changes to the extracted initrd file, such as
modifying the `default.prop` and other modifications. If you're done with
the modification, repack the initrd by following next instruction.

## Repacking the initramfs file

The factory default cpio format is `newc`, which is SVR4 portable format
with no crc. It's possible to use `crc` format, which is the same as
`newc` format plus checksum for data integrity. I recommend to just use
the default factory to ensure compatibility.

To create the `newc` cpio archive compressed with gzip, use the
following command in the initramfs working directory.

```
 find . | cpio -ov -H newc | gzip -c > ../initrd.new.cpio.gz
```

To use the 'crc' cpio format, use the following command

```
find . | cpio -ov -H crc | gzip -c > ../initrd.new.cpio.gz
```

If you are using Busybox cpio instead of GNU cpio, you must specify flag
`-H newc` to create the cpio archive.

```
busybox find . | busybox cpio -ivd -H newc | \
	busybox gzip -c > ../initrd.new.cpio.gz
```

If you don't specify -H flags, the default output for GNU cpio is binary
cpio format, which isn't supported by busybox. Use the `newc` or `crc`
format to ensure that the boot loader can use the image.

After finishing initrd.cpio.gz modification, the 512 bytes headers
should be combined with the new initrd.cpio.gz file.

```
cat initrd.headers initrd.new.cpio.gz  > initrd.img.new
```

## Combining the initramfs with the kernel

If you don't make any modification to the kernel, the modified initramfs
can used to create a new boot image file with the existing kernel image.

```
abootimg --create ../boot-new.img \
	-f ./bootimg.cfg \
	-k zImage \
	-r ./initrd.img
```

Done. Your new boot image file is ready to use. The new boot image file
is ../boot-new.img

You can create an update.zip package to install the new boot image file.

Happy hacking and have a good day!

vim:syntax=markdown
vim:tw=72

