#!/bin/bash

CONFIG=build-config
FILES=AnyKernel-Setup/kernel
echo "Your home is $HOME and this script is only FULL PATH friendly"
echo "Use FULL path do NOT shortcut your Home folder with '~/'"
echo " You have BEEN WARNED!"
if [ ! -e "$CONFIG" ]; then (
echo -n "Enter TOOLCHAINDIR and press [ENTER]: "
read -r TOOLCHAINDIR 
echo -n "Enter TOOLCHAIN and press [ENTER]: "
read -r TOOLCHAIN
echo -n "Enter LOCAL_BUILD_DIR and press [ENTER]: "
read -r LOCAL_BUILD_DIR
echo -n "Enter SYSTEM_PARTITION and press [ENTER]: "
read SYSTEM_PARTITION
echo -n "Enter DEFCONFIG and press [ENTER]: "
read DEFCONFIG
echo -n "Enter FLASH_BOOT and press [ENTER]: "
read FLASH_BOOT
echo -n "Enter PHONE and press [ENTER]: "
read PHONE
echo -n "Enter N_CORES and press [ENTER]: "
read N_CORES
echo -n "Enter VERSION and press [ENTER]: "
read VERSION
echo "CONFIG=$CONFIG">> "$CONFIG"
echo "TOOLCHAINDIR=$TOOLCHAINDIR">> "$CONFIG"
echo "TOOLCHAIN=$TOOLCHAIN">> "$CONFIG"
echo "CROSS_COMPILE=$TOOLCHAINDIR/$TOOLCHAIN/bin/arm-eabi-" >> "$CONFIG"
echo "SYSTEM_PARTITION="$SYSTEM_PARTITION"">> "$CONFIG"
echo "DEFCONFIG=$DEFCONFIG">> "$CONFIG"
echo "FLASH_BOOT=$FLASH_BOOT">> "$CONFIG"
echo "PHONE='$PHONE'">> "$CONFIG"
echo "# ----" >> "$CONFIG"
echo " ">> "$CONFIG"
echo "N_CORES=$N_CORES">> "$CONFIG"
echo "VERSION="$VERSION"">> "$CONFIG"
echo " ">> "$CONFIG"
echo "# ----">> "$CONFIG"
LOCAL_BUILD_DIR=./AnyKernel-Setup/$PHONE/$LOCAL_BUILD_DIR
TARGET_DIR=$LOCAL_BUILD_DIR/zip/$VERSION
echo "LOCAL_BUILD_DIR=$LOCAL_BUILD_DIR">> "$CONFIG"
echo "TARGET_DIR=$TARGET_DIR">> "$CONFIG"
echo 'BANNER=`cat <<EOF'>> "$CONFIG"
echo 'ui_print("$VERSION");'>> "$CONFIG"
echo 'ui_print("for");'>> "$CONFIG"
echo 'ui_print("$PHONE");'>> "$CONFIG"
echo 'EOF'>> "$CONFIG"
cat $CONFIG
)fi
if [ ! -w "$CONFIG" ]; then (
cat $CONFIG 
) fi
echo "Creating $TARGET_DIR"
mkdir -p $LOCAL_BUILD_DIR
mkdir -p $TARGET_DIR
mkdir -p $TARGET_DIR/kernel
cp $FILES/* $TARGET_DIR/kernel
