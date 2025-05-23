#!/bin/bash
# Uninstall script for RsyncUI
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling RsyncUI..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping RsyncUI if running..."
pkill -f "RsyncUI" 2>/dev/null || true

# Remove /Applications/RsyncUI.app
echo "Removing /Applications/RsyncUI.app..."
if [ -d "/Applications/RsyncUI.app" ]; then
    rm -rf "/Applications/RsyncUI.app" 2>/dev/null || true
elif [ -f "/Applications/RsyncUI.app" ]; then
    rm -f "/Applications/RsyncUI.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Caches/no.blogspot.RsyncUI
echo "Removing $HOME/Library/Caches/no.blogspot.RsyncUI..."
if [ -d "$HOME/Library/Caches/no.blogspot.RsyncUI" ]; then
    rm -rf "$HOME/Library/Caches/no.blogspot.RsyncUI" 2>/dev/null || true
elif [ -f "$HOME/Library/Caches/no.blogspot.RsyncUI" ]; then
    rm -f "$HOME/Library/Caches/no.blogspot.RsyncUI" 2>/dev/null || true
fi

# Remove $HOME/Library/Preferences/no.blogspot.RsyncUI.plist
echo "Removing $HOME/Library/Preferences/no.blogspot.RsyncUI.plist..."
if [ -d "$HOME/Library/Preferences/no.blogspot.RsyncUI.plist" ]; then
    rm -rf "$HOME/Library/Preferences/no.blogspot.RsyncUI.plist" 2>/dev/null || true
elif [ -f "$HOME/Library/Preferences/no.blogspot.RsyncUI.plist" ]; then
    rm -f "$HOME/Library/Preferences/no.blogspot.RsyncUI.plist" 2>/dev/null || true
fi

# Remove $HOME/Library/Saved Application State/no.blogspot.RsyncUI.savedState
echo "Removing $HOME/Library/Saved Application State/no.blogspot.RsyncUI.savedState..."
if [ -d "$HOME/Library/Saved Application State/no.blogspot.RsyncUI.savedState" ]; then
    rm -rf "$HOME/Library/Saved Application State/no.blogspot.RsyncUI.savedState" 2>/dev/null || true
elif [ -f "$HOME/Library/Saved Application State/no.blogspot.RsyncUI.savedState" ]; then
    rm -f "$HOME/Library/Saved Application State/no.blogspot.RsyncUI.savedState" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
