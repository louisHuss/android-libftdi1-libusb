# modify libusb
sed -i 's/__android_log_write(priority, "libusb", str);/\/\/__android_log_write(priority, "libusb", str);/g' libusb/libusb/core.c

# modify libftdi
cp ftdi_version.h libftdi/src/ftdi_version_i.h

# build for all android architectures
xmake f -p android --ndk=/opt/android-ndk -a arm64-v8a --ndk_sdkver=21 --ar=/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar
xmake -v -w
xmake f -p android --ndk=/opt/android-ndk -a armeabi --ndk_sdkver=27 --ar=/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar
xmake
xmake f -p android --ndk=/opt/android-ndk -a armeabi-v7a --ndk_sdkver=27 --ar=/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar
xmake
