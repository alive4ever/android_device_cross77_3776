### Todo lists
1. Make the system bootable
2. Make the system usable

## Making the system bootable
At least, using prebuilt kernel and kernel modules. For now, the
resulting build is not bootable. It just crashes after showing the
bootloader, without showing the well known Android UI.

## Making the system usable
Tweaks init.rc files and probably some ril-related tweaks.

## Using a kernel source instead of prebuilt kernel
This would be possible, when the prebuilt kernel works and boot as
expected. Currently, I have kernel source from Aquila dev and it should
work with little modification.

:vim:tw=72 ft=markdown
