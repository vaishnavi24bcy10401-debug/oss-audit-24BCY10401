#!/bin/bash

# Script 3: Disk and Permission Auditor
# Audits key directories for owner, permissions, and usage

# Report header
echo "========================================="
echo "     DISK AND PERMISSION AUDITOR"
echo "========================================="
echo ""

echo "Analyzing important system directories..."
echo ""

# Table headings
printf "%-20s %-20s %-12s %-12s\n" "DIRECTORY" "OWNER:GROUP" "PERMS" "SIZE"
echo "--------------------------------------------------------------------------"

# Loop through important Linux directories
for DIR in /etc /var/log /home /usr/bin /tmp; do
    if [ -d "$DIR" ]; then
        OWNER=$(ls -ld "$DIR" | awk '{print $3":"$4}')
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-20s %-12s %-12s\n" "$DIR" "$OWNER" "$PERMS" "$SIZE"

        # Also show filesystem usage using df as required in task concepts
        FS_USAGE=$(df -hP "$DIR" 2>/dev/null | awk 'NR==2 {print $5}')
        [ -n "$FS_USAGE" ] && echo "  Filesystem usage for $DIR: $FS_USAGE"
    else
        printf "%-20s %-20s %-12s %-12s\n" "$DIR" "NOT FOUND" "-" "-"
    fi
done

echo ""
echo "========================================="
echo "     FIREFOX CONFIGURATION CHECK"
echo "========================================="
echo ""

# Check chosen software configuration directory
FIREFOX_DIR="$HOME/.mozilla/firefox"

if [ -d "$FIREFOX_DIR" ]; then
    echo "✓ Firefox configuration found at: $FIREFOX_DIR"
    PERMS=$(ls -ld "$FIREFOX_DIR" | awk '{print $1, $3, $4}')
    echo "  Permissions: $PERMS"
else
    echo "• Firefox configuration not found"
    echo "  (Firefox may not be installed or never launched)"
fi

echo ""
echo "========================================="