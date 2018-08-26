#!/bin/bash

export TOOLCHAIN=/android/kernel/toolchain
export MKBOOTIMAGE=/home/chris/src/mkbootimg/mkbootimg
export OUTDIR=/android/kernel/out2

export CROSS_COMPILE=aarch64-linux-gnu-
export PATH=$TOOLCHAIN/bin:$PATH

make O=$OUTDIR ARCH=arm64 pie_defconfig

if [ $? -ne 0 ] ; then
	exit $?
fi

make O=$OUTDIR ARCH=arm64 -j 4

if [ $? -ne 0 ] ; then
	exit $?
fi

$MKBOOTIMAGE --kernel $OUTDIR/arch/arm64/boot/Image.gz \
  --cmdline 'loglevel=4 initcall_debug=n page_tracker=on slub_min_objects=16 unmovable_isolate1=2:192M,3:224M,4:256M printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=enforcing buildvariant=eng' \
  --base 0x78000 \
  --pagesize 2048 \
  --kernel_offset 0x8000 \
  --ramdisk_offset 0x7b88000 \
  --second_offset 0xf00000 \
  --tags_offset 0x7988000 \
  --os_version 9.0.0 \
  --os_patch_level 2018-08 \
  --hash sha1 \
  -o $OUTDIR/kernel.img


