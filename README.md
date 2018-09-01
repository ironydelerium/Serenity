# Dependencies

* [mkbootimg](https://github.com/osm0sis/mkbootimg)
* [Linaro GCC 4.9 for aarch64-linux-gnu](https://releases.linaro.org/components/toolchain/binaries/latest-4/aarch64-linux-gnu/)

# Building

Edit make_image.sh, change:

* TOOLCHAIN should be set to the full path to the Linaro GCC toolchain.
* MKBOOTIMAGE should be set to the path of the mkbootimg binary.
* OUTDIR should be the directory you want the compiled files to go

Run `./make_image.sh`. If the compile is successful, you will have `$OUTDIR/kernel.img` available for fastboot flashing.

# make_image.sh

By default, running `./make_image.sh` will do a full build and place the resulting `kernel.img` file into $OUTDIR.

* `./make_image.sh defconfig` -- construct the default configuration
* `./make_image.sh build` -- executes the build
* `./make_image.sh devbuild` -- executes the build, but with 'make -j1' (for easier finding code that broke)
* `./make_image.sh makeimage` -- constructs the kernel.img file
* `./make_image.sh confiugre` -- starts Linux kernel configuration (menuconfig)
* `./make_image.sh all` -- the default: defconfig, build, makeimage

# Changes from [upstream](https://github.com/wirmpolter/Serenity)

* pie_defconfig, based on serenity_defconfig
* Huawei livepatching (OASES) disabled.
* Huawei runtime data recorder (blackbox) disabled.
* Huawei bootfail monitor disabled.
* Huawei root checker disabled.
* Code changes around the disabling of the blackbox and BFM stacks. 
  (Huawei, of course, didn't make these easy to remove; the code didn't account for the options at all.)
* Mali driver has been patched to allow the use of the [HiKey960](https://www.96boards.org/product/hikey960/) Mali driver stack, instead of the Huawei stack.

# Known issues

* Disabled DSS panel shutoff. Pie currently fails to re-enable the display panel once it's been shut off, and ioctl(framebuffer_fd, FBIOBLANK, FB_BLANK_UNBLANK)
  does not seem to correct this.

# Thanks

[wirmpolter](https://gituhb.com/wirmpolter)

