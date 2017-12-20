#!/bin/bash

# Clone this script in your ROM Repo using following commands.
# cd rom_repo
# curl https://raw.githubusercontent.com/redking12/legacy_script/master/abhay.sh > script_build.sh


# Build ROM
. build/envsetup.sh
lunch validus_kuntao-userdebug
export KBUILD_BUILD_USER=Abhay
export KBUILD_BUILD_HOST=PoloniumBox
brunch kuntao
