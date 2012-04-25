#!/bin/sh

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0.02

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 12

echo "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
