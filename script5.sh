#!/bin/bash

# Script 5: Open Source Manifesto Generator
# Collects user input and writes a personalized manifesto to a text file
# Alias concept note: an alias like `alias ll='ls -la'` is a user shortcut for commands.

# Header output
echo "========================================="
echo "     OPEN SOURCE MANIFESTO GENERATOR"
echo "========================================="
echo ""
echo "Answer a few questions to create your"
echo "personal open source manifesto."
echo ""

echo "Question 1:"
read -p "  Name one open-source tool you use every day: " TOOL
echo ""

echo "Question 2:"
read -p "  In one word, what does 'freedom' mean to you? " FREEDOM
echo ""

echo "Question 3:"
read -p "  Name one thing you would build and share freely: " BUILD
echo ""

# Output file name with current user
OUTPUT="manifesto_$(whoami).txt"

# Compose manifesto content and save to file
echo "=========================================" > "$OUTPUT"
echo "     MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "     Created on: $(date '+%B %d, %Y')" >> "$OUTPUT"
echo "=========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe in the power of open source software." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day, I use $TOOL. This tool exists because" >> "$OUTPUT"
echo "someone chose to share their work freely with the world." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, \"$FREEDOM\" means having the ability to:" >> "$OUTPUT"
echo "  - Learn how software really works" >> "$OUTPUT"
echo "  - Modify it to suit my needs" >> "$OUTPUT"
echo "  - Share improvements with others" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Inspired by this philosophy, I would build $BUILD" >> "$OUTPUT"
echo "and release it as open source. This way, others can" >> "$OUTPUT"
echo "benefit from it, improve it, and pass it forward." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "This is my commitment: to build openly, share freely," >> "$OUTPUT"
echo "and contribute to the knowledge that belongs to everyone." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "=========================================" >> "$OUTPUT"

echo "✓ Manifesto saved to: $OUTPUT"
echo ""
echo "========================================="
echo "          YOUR MANIFESTO"
echo "========================================="
echo ""
cat "$OUTPUT"
echo ""
echo "========================================="