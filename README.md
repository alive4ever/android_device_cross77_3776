# Cyanogenmod port for Cross A7S (codename `cross77_3776`)

This is my work in progress of porting cm-11.0 to Cross (now Evercoss)
A7S. This port is currently unstable. I'm still in progress of making
the recovery image buildable.

~~Currently, the recovery image is not buildable. The build stopped at
mkbootimg process, which indicated that something is missing.~~

For your information, this source tree is generated by `mkvendor.sh`
script from `build/tools/device` directory under cm source tree. I've
added modification to the files, based on the information I obtained
from official Cross A7S 4.1.2 ROM.

**Edit**: As of 21 February 2016, the recovery image is buildable from the
cm-11.0 source tree.  Make sure to sync your worktree to latest commit
from cm-11.0 branch.

TWRP for Android 5.1 and 6.0 branch are buildable, but the resulting
image is too large (>6MB) to fit into recovery partition. There are some
vector related errors with TWRP Android 4.4 branch, so that's not
buildable. If you are curious, you may add
`omnirom/android_bootable_recovery` to your `local_manifest.xml` to
experiment with building TWRP and replace `bootable/recovery` with TWRP.

## Boot and initrd information.

If you have `boot.img` file from the official build, be sure to remove
first 512 bytes of splitted `initramfs.cpio.gz` to extract the initramfs
image. More details can be found [here](./INITRDINFO.md). After that,
you must recompile the `new-boot.img` using the modified
`initramfs.cpio.gz` file, so that the `unpackbootimg` utility is able to
decompress the initramfs. Use `cpio` or `bsdtar` to unpack the initramfs.
Alternatively, you may use [Carliv Image Kitchen for
Android](http://forum.xda-developers.com/android/development/tool-cika-carliv-image-kitchen-android-t3013658)
to simplify the process of unpacking MTK-based boot image files.

The original `boot.img` file is not included here. There is a `kernel`
file instead, which is just a kernel without ramdisk obtained from
running `mkvendor.sh` script.

If you want to decompress the kernel, just follow the instruction
[here](./BOOTINFO.md). Remember that the kernel is binary file, so you
won't get any information from the kernel binary. You should look at
kernel source code instead.

~~For now, I'm currently asking Evercoss to release the kernel source
code. There's no reply from them, so don't expect too much about it.~~

There is no reply from Evercoss about releasing the kernel source and
all related components. We are on our own, finding what needed to make a
working port of cm-11.0 for this device.

# For those who have interest with this project,

Feel free to clone and fork this repository. I'll be glad to receive and
review pull requests. Let's develop and share!

------------------------------------------------------------------------

# License
The entire code of my modification is licensed under
[GPLv2](./LICENSE.md) or later.

You are free to modify the source code for your own use, but if you
release the software derived from this source code, you must release
your modification for the benefits of free software community.

I allow you to *use and modify my code*, but be sure to **give back your
improvements** to the free software community, so that we can enjoy the
improvements.

------------------------------------------------------------------------

 vim:textwidth=72
 vim:syntax=markdown
