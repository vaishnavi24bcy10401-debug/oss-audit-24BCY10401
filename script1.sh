#!/bin/bash

# Script 1: System Identity Report
# Course: Open Source Software Audit

# Resolve OS display name across Linux/macOS
if [ -f /etc/os-release ]; then
	OS_NAME=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d'=' -f2- | tr -d '"')
else
	OS_NAME="$(uname -s) $(uname -m)"
fi

# Resolve uptime across different uptime implementations
if uptime -p >/dev/null 2>&1; then
	SYSTEM_UPTIME=$(uptime -p)
else
	SYSTEM_UPTIME=$(uptime | sed 's/.*up \([^,]*\).*/\1/')
fi

# Display header

echo "========================================="
echo "       SYSTEM IDENTITY REPORT"
echo "========================================="
echo ""

# User and host information
echo "Hostname: $(hostname)"
echo "Logged in user: $(whoami)"
echo "Home directory: $HOME"
echo ""

# Linux distribution and kernel information
echo "Operating System Details:"
echo "$OS_NAME"
echo ""
echo "Kernel Version: $(uname -r)"
echo ""

# Uptime and current timestamp
echo "System Uptime: $SYSTEM_UPTIME"
echo ""
echo "Current Date and Time: $(date)"
echo ""

# License message
echo "Open Source License: GNU General Public License v2"
echo "========================================="