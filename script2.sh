#!/bin/bash

# Script 2: FOSS Package Inspector
# Checks installation status, version/license info, and package philosophy note

# Report header
echo "========================================="
echo "       FOSS PACKAGE INSPECTOR"
echo "========================================="
echo ""

PACKAGE="firefox"

# Detect package manager available on Linux
PKG_MANAGER="unknown"
if command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
elif command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
fi

# Fallback command check for systems without rpm/dpkg (e.g., macOS)
PACKAGE_CMD_FOUND="no"
if command -v "$PACKAGE" &>/dev/null; then
    PACKAGE_CMD_FOUND="yes"
fi

echo "Checking if $PACKAGE is installed..."
echo ""

# Check installation and print metadata using rpm/dpkg with grep
if [ "$PKG_MANAGER" = "rpm" ]; then
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "✓ STATUS: $PACKAGE IS INSTALLED"
        echo ""
        echo "Package Information:"
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "✗ STATUS: $PACKAGE IS NOT INSTALLED"
        echo ""
        echo "To install, run: sudo dnf install $PACKAGE"
    fi
elif [ "$PKG_MANAGER" = "dpkg" ]; then
    if dpkg -l | grep -qw "$PACKAGE"; then
        echo "✓ STATUS: $PACKAGE IS INSTALLED"
        echo ""
        echo "Package Information:"
        dpkg -l | grep -w "$PACKAGE"
        echo ""
        echo "Version Information:"
        "$PACKAGE" --version 2>/dev/null | head -n 1 || echo "  Version details available via package manager"
    else
        echo "✗ STATUS: $PACKAGE IS NOT INSTALLED"
        echo ""
        echo "To install, run: sudo apt install $PACKAGE"
    fi
else
    echo "Could not detect rpm or dpkg on this system."
    if [ "$PACKAGE_CMD_FOUND" = "yes" ]; then
        echo "✓ STATUS: $PACKAGE command is available in PATH"
        echo ""
        echo "Version Information:"
        "$PACKAGE" --version 2>/dev/null | head -n 1 || echo "  Version details not available"
    else
        echo "✗ STATUS: $PACKAGE command is not available in PATH"
        echo "Install check skipped for non-rpm/dpkg system."
    fi
fi

echo ""
echo "========================================="
echo "          LICENSE INFORMATION"
echo "========================================="
echo ""
echo "Firefox uses the Mozilla Public License 2.0 (MPL 2.0)"
echo ""
echo "The Four Freedoms of Free Software:"
echo "  1. Run the program for any purpose"
echo "  2. Study and modify the source code"
echo "  3. Share copies with others"
echo "  4. Share modified versions"
echo ""

# Case statement: one-line philosophy note by package name
case "$PACKAGE" in
    firefox)
        echo "Firefox: protects user choice and keeps the web open through transparent development."
        ;;
    httpd)
        echo "Apache HTTP Server: helped build a free and interoperable web ecosystem."
        ;;
    mysql)
        echo "MySQL: community-driven database powering open application development."
        ;;
    vlc)
        echo "VLC: media freedom through open standards and broad format support."
        ;;
    *)
        echo "$PACKAGE: open-source software that can be studied, modified, and shared."
        ;;
esac

echo "========================================="