#!/bin/bash

# Clone this script in your ROM Repo using following commands.
# cd rom_repo
# curl https://raw.githubusercontent.com/redking12/legacy_script/master/abhay.sh > script_build.sh

echo -e ${blu}"CCACHE is enabled for this build"${txtrst}
export USE_CCACHE=1
export PATH="/usr/lib/ccache/:$PATH"
prebuilts/misc/linux-x86/ccache/ccache -M 50G

# Build ROM
. build/envsetup.sh
lunch validus_kuntao-userdebug
export KBUILD_BUILD_USER=Abhay
export KBUILD_BUILD_HOST=PoloniumBox
brunch kuntao

