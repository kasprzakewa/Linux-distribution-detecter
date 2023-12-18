#!/bin/bash
source library.sh

detect_package_manager
$PKG_UPDATE

if [ "$PKG_UPDATE" = "pacman -Sy" ] || [ "$PKG_UPDATE" = "dnf update" ]; then
    $PKG_INSTALL gcc make git clang cmake clang-tools-extra
else
    $PKG_INSTALL gcc make git clang cmake clang-tools
fi

packages=("gcc" "make" "git" "clang" "cmake" "clang-check")

for package in "${packages[@]}"; do
    if command -v "$package" > /dev/null 2>&1; then
        echo "$package is installed."
    else
        echo "Error: $package not found."
        exit 1
    fi
done
