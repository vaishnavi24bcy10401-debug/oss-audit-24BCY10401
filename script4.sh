#!/bin/bash

# Script 4: Log File Analyzer
# Reads a logfile, counts keyword matches, and prints summary

# Report header
echo "========================================="
echo "          LOG FILE ANALYZER"
echo "========================================="
echo ""

# Pick a sensible default logfile across Linux/macOS
DEFAULT_LOGFILE=""
for CANDIDATE in /var/log/syslog /var/log/messages /var/log/system.log; do
    if [ -f "$CANDIDATE" ]; then
        DEFAULT_LOGFILE="$CANDIDATE"
        break
    fi
done
[ -z "$DEFAULT_LOGFILE" ] && DEFAULT_LOGFILE="/var/log/syslog"

LOGFILE="${1:-$DEFAULT_LOGFILE}"
KEYWORD="${2:-error}"

echo "Log file to analyze: $LOGFILE"
echo "Searching for keyword: $KEYWORD"
echo ""

if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File '$LOGFILE' not found!"
    echo ""
    echo "How to use this script:"
    echo "  ./script4.sh [logfile] [keyword]"
    echo ""
    echo "Example:"
    echo "  ./script4.sh /var/log/syslog warning"
    exit 1
fi

# Do-while style retry when file is empty
while :; do
    if [ -s "$LOGFILE" ]; then
        break
    fi

    echo "WARNING: '$LOGFILE' is empty."
    read -p "Enter another log file path (or type 'q' to quit): " RETRY_FILE

    if [ "$RETRY_FILE" = "q" ]; then
        echo "Exiting without analysis."
        exit 1
    fi

    if [ ! -f "$RETRY_FILE" ]; then
        echo "ERROR: File '$RETRY_FILE' not found!"
    else
        LOGFILE="$RETRY_FILE"
        echo "Switched to: $LOGFILE"
    fi
done

# Line-by-line keyword count using while-read loop
COUNT=0
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "========================================="
echo "                RESULTS"
echo "========================================="
echo ""
echo "Total matches found: $COUNT"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "Last 5 matching lines:"
    echo "-----------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
    echo ""
else
    echo "No matches found for '$KEYWORD'"
    echo "Try searching with a different keyword"
    echo ""
fi

echo "========================================="