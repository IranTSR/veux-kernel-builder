### AnyKernel3 Ramdisk Mod Script
## veux (POCO X4 Pro 5G) - KernelSU Next kernel
## Kernel 5.4.302 + KernelSU-Next legacy driver v3.4.0-legacy

### AnyKernel setup
# global properties
properties() { '
kernel.string=veux KernelSU-Next 5.4.302 (KSU-Next v3.4.0-legacy)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=veux
device.name2=peux
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
split_boot; # kernel-only flash: skip ramdisk unpack/repack

flash_boot;
## end boot install
