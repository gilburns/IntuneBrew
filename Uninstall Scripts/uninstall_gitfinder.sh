#!/bin/bash
# Uninstall script for GitFinder
# Generated by IntuneBrew

# Exit on error
set -e

echo "Uninstalling GitFinder..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Kill application process if running
echo "Stopping GitFinder if running..."
pkill -f "GitFinder" 2>/dev/null || true

# Unload service ag.zigz.GitFinder.GitFinderLauncher
echo "Unloading service ag.zigz.GitFinder.GitFinderLauncher..."
launchctl unload -w /Library/LaunchAgents/ag.zigz.GitFinder.GitFinderLauncher.plist 2>/dev/null || true
launchctl unload -w /Library/LaunchDaemons/ag.zigz.GitFinder.GitFinderLauncher.plist 2>/dev/null || true
launchctl unload -w ~/Library/LaunchAgents/ag.zigz.GitFinder.GitFinderLauncher.plist 2>/dev/null || true

# Kill application with bundle ID ag.zigz.GitFinder if running
echo "Stopping application with bundle ID ag.zigz.GitFinder if running..."
killall -9 "ag.zigz.GitFinder" 2>/dev/null || true

# Kill application with bundle ID ag.zigz.GitFinder.GitFinderSync if running
echo "Stopping application with bundle ID ag.zigz.GitFinder.GitFinderSync if running..."
killall -9 "ag.zigz.GitFinder.GitFinderSync" 2>/dev/null || true

# Remove /Applications/GitFinder.app
echo "Removing /Applications/GitFinder.app..."
if [ -d "/Applications/GitFinder.app" ]; then
    rm -rf "/Applications/GitFinder.app" 2>/dev/null || true
elif [ -f "/Applications/GitFinder.app" ]; then
    rm -f "/Applications/GitFinder.app" 2>/dev/null || true
fi

# Remove $HOME/Library/Application Scripts/ag.zigz.GitFinder*
echo "Removing $HOME/Library/Application Scripts/ag.zigz.GitFinder*..."
if [ -d "$HOME/Library/Application Scripts/ag.zigz.GitFinder*" ]; then
    rm -rf "$HOME/Library/Application Scripts/ag.zigz.GitFinder*" 2>/dev/null || true
elif [ -f "$HOME/Library/Application Scripts/ag.zigz.GitFinder*" ]; then
    rm -f "$HOME/Library/Application Scripts/ag.zigz.GitFinder*" 2>/dev/null || true
fi

# Remove $HOME/Library/Containers/ag.zigz.GitFinder*
echo "Removing $HOME/Library/Containers/ag.zigz.GitFinder*..."
if [ -d "$HOME/Library/Containers/ag.zigz.GitFinder*" ]; then
    rm -rf "$HOME/Library/Containers/ag.zigz.GitFinder*" 2>/dev/null || true
elif [ -f "$HOME/Library/Containers/ag.zigz.GitFinder*" ]; then
    rm -f "$HOME/Library/Containers/ag.zigz.GitFinder*" 2>/dev/null || true
fi

# Remove $HOME/Library/Group Containers/*.ag.zigz.GitFinder
echo "Removing $HOME/Library/Group Containers/*.ag.zigz.GitFinder..."
if [ -d "$HOME/Library/Group Containers/*.ag.zigz.GitFinder" ]; then
    rm -rf "$HOME/Library/Group Containers/*.ag.zigz.GitFinder" 2>/dev/null || true
elif [ -f "$HOME/Library/Group Containers/*.ag.zigz.GitFinder" ]; then
    rm -f "$HOME/Library/Group Containers/*.ag.zigz.GitFinder" 2>/dev/null || true
fi

echo "Uninstallation complete!"
exit 0
