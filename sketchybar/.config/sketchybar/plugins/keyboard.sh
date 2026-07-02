#!/bin/bash

# Get the full output of AppleSelectedInputSources
INPUT_SOURCES=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null)

# Try to extract KeyboardLayout Name first
LAYOUT=$(echo "$INPUT_SOURCES" | grep -w 'KeyboardLayout Name' | sed -E 's/.*"([^"]+)".*/\1/')

# If KeyboardLayout Name is empty, try to extract from Input Source ID
if [ -z "$LAYOUT" ]; then
  # This regex is more general, looking for any string after the last dot before a double quote
  LAYOUT=$(echo "$INPUT_SOURCES" | grep 'Input Source ID' | sed -E 's/.*\.([^"]+)".*/\1/')
fi

# Fallback if still empty (e.g., if no input sources are active or parsing fails completely)
if [ -z "$LAYOUT" ]; then
  LAYOUT="Pinyin" # Use a question mark or similar to indicate unknown
fi

# Map common input methods to friendlier names
case "$LAYOUT" in
"ITABC") LAYOUT="Pinyin" ;;
"U.S.") LAYOUT="US" ;;           # Abbreviate U.S. to EN
"Latin American") LAYOUT="LA" ;; # Abbreviate Latin American to ES
"EmojiFunctionRow") LAYOUT="Emoji" ;;
"UnicodeHexInput") LAYOUT="Unicode" ;;
  # Add other mappings here as needed, e.g., for specific languages like "French", "German", etc.
esac

# Set the label
sketchybar -m --set $NAME label="$LAYOUT"
