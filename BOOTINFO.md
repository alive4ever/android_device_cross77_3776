# zImage information

The extracted zImage is including additional 18916 bytes data in the
beginning of the file. So that, those additional bytes need to be
skipped from the file using dd.

```
dd if=zImage bs=1 skip=18916 of=zImage.gz
```

The first 18916 bytes of zImage can be extracted from zImage using the
following command.

```
dd if=zImage bs=1 count=18916 of zImage.header
```

After finishing zImage modification, the 18916 header should be put back
with the finished zImage. I think the zImage is binary kernel file that
can't be extracted. To make the modification, you need to get the kernel
source, make any necessary modification to kernel configuration, and
cross compile the kernel using Android NDK

```
cat zImage.header zImage.new.gz > zImage.new
```

That's all!

 vim:syntax=markdown
 vim:set tw=72
