#!/bin/bash

# Clone this script in your ROM Repo using following commands.
# cd rom_repo
# curl https://raw.githubusercontent.com/nsytechno/scripts/master/scripts.sh > script_build.sh

# Some User's Details. Please fill it with your own details.
export KBUILD_BUILD_USER=Nsytechno
export KBUILD_BUILD_HOST=GodValley

# Replace "legacy" with your own SSH Username in lowercase
username=legacy

# Colors makes things beautiful
export TERM=xterm

    red=$(tput setaf 1)             #  red
    grn=$(tput setaf 2)             #  green
    blu=$(tput setaf 4)             #  blue
    cya=$(tput setaf 6)             #  cyan
    txtrst=$(tput sgr0)             #  Reset

# CCACHE UMMM!!! Cooks my builds fast

echo -e ${blu}"CCACHE is enabled for this build"${txtrst}
export USE_CCACHE=1
export PATH="/usr/lib/ccache/:$PATH"
prebuilts/misc/linux-x86/ccache/ccache -M 50G


# Build ROM
. build/envsetup.sh
lunch "$lunch_command"_"$device"-userdebug
make bacon -j16
