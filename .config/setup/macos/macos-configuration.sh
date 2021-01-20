#!/bin/bash

# Set macOS update check frequency to every 1 day
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Set keyboard to repeat key when it is pressed (instead of showing ulmauts etc).
defaults write -g ApplePressAndHoldEnabled -bool false

# Change Caps Lock keybord key to produce Esc key
# See Key Table Usages
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
hidutil property --set \
    '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'


# System Preferences > General > Appearance
defaults write -globalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# System Preferences > General > Sidebar icon size: Medium
defaults write -globalDomain NSTableViewDefaultSizeMode -int 2

# System Preferences > Dock > Size:
defaults write com.apple.dock tilesize -int 36

# System Preferences > Dock > Magnification:
defaults write com.apple.dock magnification -bool false

# System Preferences > Dock > Size (magnified):
# defaults write com.apple.dock largesize -int 54

# System Preferences > Dock > Minimize windows using: Scale effect
# defaults write com.apple.dock mineffect -string "scale"

# System Preferences > Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# System Preferences > Dock > Automatically hide and show the Dock:
# defaults write com.apple.dock autohide -bool false

# System Preferences > Dock > Automatically hide and show the Dock (duration)
# defaults write com.apple.dock autohide-time-modifier -float 0.5

# System Preferences > Dock > Automatically hide and show the Dock (delay)
# defaults write com.apple.dock autohide-delay -float 0

# System Preferences > Dock > Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# System Preferences > Mission Controll > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# System Preferences > Mission Controll > Dashboard
defaults write com.apple.dock dashboard-in-overlay -bool true

# System Preferences > Keyboard >
# defaults write NSGlobalDomain KeyRepeat -int 2

# System Preferences > Keyboard >
# defaults write NSGlobalDomain InitialKeyRepeat -int 15

# System Preferences > Trackpad > Tap to click
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# System Preferences > Accessibility > Mouse & Trackpad > Trackpad Potions
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false

# System Preferences > Accessibility > Mouse & Trackpad > Trackpad Potions


# Finder > Preferences > Show all filename extensions
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder > Preferences > Show wraning before changing an extension
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferences > Show wraning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Finder > View > As List
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Others:

# Completely Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true

# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."
