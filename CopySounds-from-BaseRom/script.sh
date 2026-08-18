#!/bin/bash

dir1="build/portrom/images/my_product/product_overlay/media"
dir2="build/portrom/images/system_ext/media/audio"
src1="build/baserom/images/my_product/product_overlay/media"
src2="build/baserom/images/system_ext/media/audio/"

check1=$(find "$dir1" -type f -size +0c 2>/dev/null)
check2=$(find "$dir2" -mindepth 1 \( -type d -o -type f -size +0c \) 2>/dev/null)

if [[ -n "$check1" && -n "$check2" ]]; then
    blue "System audio files already exist. Skipping."
    return 0
fi

if [[ -z "$check1" ]]; then
    blue "Copying media files to $dir1 from baserom"
    mkdir -p "${dir1%/*}"
    cp -rf "$src1" "${dir1%/*}/"
fi

if [[ -z "$check2" ]]; then
    blue "Copying audio files to $dir2 from baserom"
    mkdir -p "$dir2"
    cp -rf "$src2"* "$dir2/"
fi
	