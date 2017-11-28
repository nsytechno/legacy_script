#!/bin/bash

# Clone this script in your ROM Repo using following commands.
# cd rom_repo
# curl https://raw.githubusercontent.com/redking12/legacy_script/master/abhay.sh > script_build.sh

# Some User's Details. Please fill it with your own details.
export KBUILD_BUILD_USER=Abhay
export KBUILD_BUILD_HOST=PoloniumBox

# Replace "legacy" with your own SSH Username in lowercase
username=surajparmar6

# Colors makes things beautiful
export TERM=xterm

    red=$(tput setaf 1)             #  red
    grn=$(tput setaf 2)             #  green
    blu=$(tput setaf 4)             #  blue
    cya=$(tput setaf 6)             #  cyan
    txtrst=$(tput sgr0)             #  Reset

# CCACHE UMMM!!! Cooks my builds fast

if [ "$use_ccache" = "yes" ];
then
echo -e ${blu}"CCACHE is enabled for this build"${txtrst}
export USE_CCACHE=1
export CCACHE_DIR=/home/ccache/nikhil
prebuilts/misc/linux-x86/ccache/ccache -M 50G
fi

if [ "$use_ccache" = "clean" ];
then
export CCACHE_DIR=/home/ccache/nikhil
ccache -C
wait
echo -e ${grn}"CCACHE Cleared"${txtrst};
fi

# Its Clean Time
if [ "$make_clean" = "yes" ];
then
make clean && make clobber
wait
echo -e ${cya}"OUT dir from your repo deleted"${txtrst};
fi

# Build ROM
. build/envsetup.sh
lunch "$lunch_command"_"$device"-userdebug
make "$target_command" -j16
