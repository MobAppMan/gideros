rm -rf libs

#NDK=c:/NVPACK/android-ndk-r10c
#NDKHOSTARCH=linux-8x6
#NDKHOST_CC="gcc -m32"
NDKABI=8
NDKVER=$NDK/toolchains/arm-linux-androideabi-4.6
NDKP=$NDKVER/prebuilt/$NDKHOSTARCH/bin/arm-linux-androideabi-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm"
NDKARCH=
make clean
make HOST_CC=$NDKHOST_CC CROSS=$NDKP TARGET_FLAGS="$NDKF" TARGET_CFLAGS="-I../../libgvfs" TARGET_LIBS="-L../../libgvfs/libs/armeabi -lgvfs"
mkdir -p libs/armeabi 
cp src/libluajit.so libs/armeabi

NDKABI=8
NDKVER=$NDK/toolchains/arm-linux-androideabi-4.6
NDKP=$NDKVER/prebuilt/$NDKHOSTARCH/bin/arm-linux-androideabi-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm"
NDKARCH="-march=armv7-a -mfloat-abi=softfp -Wl,--fix-cortex-a8"
make clean
make HOST_CC=$NDKHOST_CC CROSS=$NDKP TARGET_FLAGS="$NDKF $NDKARCH" TARGET_CFLAGS="-I../../libgvfs" TARGET_LIBS="-L../../libgvfs/libs/armeabi-v7a -lgvfs"
mkdir -p libs/armeabi-v7a
cp src/libluajit.so libs/armeabi-v7a

NDKABI=14
NDKVER=$NDK/toolchains/x86-4.6
NDKP=$NDKVER/prebuilt/$NDKHOSTARCH/bin/i686-linux-android-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-x86"
NDKARCH=
make clean
make HOST_CC=$NDKHOST_CC CROSS=$NDKP TARGET_FLAGS="$NDKF" TARGET_CFLAGS="-I../../libgvfs" TARGET_LIBS="-L../../libgvfs/libs/x86 -lgvfs"
mkdir -p libs/x86
cp src/libluajit.so libs/x86

