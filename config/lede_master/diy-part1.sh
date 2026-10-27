#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Add the fastfetch4openwrt feed (https://github.com/mineextremely/Fastfetch4Openwrt)
# This script runs before "feeds update -a", so the feed is fetched and installed automatically.
# The "grep -q" guard keeps the script idempotent: it never appends a duplicate line.
grep -q "src-git fastfetch4openwrt" feeds.conf.default 2>/dev/null ||
    sed -i '$a src-git fastfetch4openwrt https://github.com/mineextremely/Fastfetch4Openwrt.git' feeds.conf.default

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}

