#!/bin/bash
# ====================================
# Variables
# ====================================
COMPUTER_NAME="HFMAC112"
LOCK_SCREEN_MESSAGE="pasi.bergman@hiq.fi | +358-45-349 3294 | $COMPUTER_NAME"

# ------------------------------------
# Preparations
# ------------------------------------
# Close System Preferences if open
osascript -e 'tell application "System Preferences" to quit'
# Ask or admin password
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; \
    sleep 60; kill -0 "$$" || exit; \
    done 2>/dev/null &

# -------------------------------------
# App Store & Updates
# -------------------------------------
# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Set macOS update check frequency to every 1 day
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
# Automatically download apps purchased on other Macs
# defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1
# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true
# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

# -------------------------------------
# Security & Privacy
# -------------------------------------
# Require password immediately after sleep or screen saver begins
sudo defaults write com.apple.screensaver askForPassword -int 1
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0
# Set lock screen message
 sudo defaults write /Library/Preferences/com.apple.loginwindow \
     LoginwindowText -string "$LOCK_SCREEN_MESSAGE"
# Enable firewall, allow incoming for build-in applicatios and signed applications
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo defaults write /Library/Preferences/com.apple.alf allowdownloadsignedenabled -int 1
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -int 1
# Enable firewall stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1
# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName


# -------------------------------------
# Sharing
# -------------------------------------
# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write \
    /Library/Preferences/SystemConfiguration/com.apple.smb.server \
    NetBIOSName -string $COMPUTER_NAME


# -------------------------------------
# Finder
# -------------------------------------
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Disable the crash reporter
#defaults write com.apple.CrashReporter DialogType -string "none"
# Mak Crash Reporter appear as a notification
defaults write com.apple.CrashReporter UseUNC -int 1
# Show wraning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
# View: As List
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# View: Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
# defaults write com.apple.finder QuitMenuItem -bool true
# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true
# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# defaults write com.apple.finder NewWindowTarget -string "PfDe"
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Finder: show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Disable disk image verification
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# Show item info near icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# Show item info to the right of the icons on the desktop
# /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist
# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Increase grid spacing for icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
#
# Increase the size of icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# Use list view in all Finder windows by default
# Disable the warning before emptying the Trash
# defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Enable AirDrop over Ethernet and on unsupported Macs running Lion
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
# Show the ~/Library folder
chflags nohidden ~/Library # && xattr -d com.apple.FinderInfo ~/Library
# Show the /Volumes folder
sudo chflags nohidden /Volumes
# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true
# Keep Quick Look window in front
defaults write com.apple.Finder QLHidePanelOnDeactivate -int 0


# -------------------------------------
# Keyboard
# -------------------------------------
# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic period
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Set keyboard to repeat key when it is pressed (instead of showing ulmauts etc).
defaults write -g ApplePressAndHoldEnabled -bool false
# Change Caps Lock keybord key to produce Esc key
# See Key Table Usages
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
hidutil property --set \
    '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10


# -------------------------------------
# Trackpad
# -------------------------------------
# Trackpad clicking
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
# System Preferences > Accessibility > Mouse & Trackpad > Trackpad Potions
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false

# -------------------------------------
# General, Desktop, Mission Control
# -------------------------------------
# System Preferences > General > Appearance
defaults write -globalDomain AppleInterfaceStyleSwitchesAutomatically -bool true
# System Preferences > General > Sidebar icon size: Medium
defaults write -globalDomain NSTableViewDefaultSizeMode -int 2
# System Preferences > Mission Controll > Automatically rearrange Spaces based on most recent use
 defaults write com.apple.dock mru-spaces -bool false
# System Preferences > Mission Controll > Dashboard
# defaults write com.apple.dock dashboard-in-overlay -bool true
# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false
# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1
# Allow Handoff between this Mac and iCloud devices
defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true


# -------------------------------------
# Dock
# -------------------------------------
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
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true
# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"
# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true
# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
# Don’t show recent applications in Dock
# defaults write com.apple.dock show-recents -bool false
# Dock on the left side of the screen
defaults write com.apple.dock orientation -string "left"


# -------------------------------------
# Language & localization
# -------------------------------------
defaults write NSGlobalDomain AppleLanguages -array "en-US" "fi-FI"
defaults write NSGlobalDomain AppleLocale -string "en_FI@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true
# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Helsinki" > /dev/null

# -------------------------------------
# Power management
# -------------------------------------
# Enable lid wakeup
sudo pmset -a lidwake 1
# Restart automatically on power loss
# sudo pmset -a autorestart 1
# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on
# Sleep the display after 15 minutes
sudo pmset -a displaysleep 15
# Disable machine sleep while charging
sudo pmset -c sleep 0
# Set machine sleep to 15 minutes on battery
sudo pmset -b sleep 15
# Set standby delay to 24 hours (default is 1 hour)
# sudo pmset -a standbydelay 86400
# Never go into computer sleep mode
# sudo systemsetup -setcomputersleep Off > /dev/null


# -------------------------------------
# Display
# -------------------------------------
# Save screenshots to the $HOME/Screenshots
[[ -d $HOME/Screenshots ]] || mkdir $HOME/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true


# -------------------------------------
# Safari & Webkit
# -------------------------------------
# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"
# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false
# Hide Safari’s sidebar in Top Sites
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false
# Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
# Enable Safari’s debug menu
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
# Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
# Disable plug-ins
# defaults write com.apple.Safari WebKitPluginsEnabled -bool false
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false
# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false
# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# -------------------------------------
# Mail.app
# -------------------------------------
# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false


# -------------------------------------
# Spotlight
# -------------------------------------
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

#Load new settings before rebuilding the index
killall mds > /dev/null 2>&1
# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null
# Rebuild the index from scratch
sudo mdutil -E / > /dev/null


# -------------------------------------
# Photos.app
# -------------------------------------
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


# -------------------------------------
# Activity Monitor
# -------------------------------------
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0


# -------------------------------------
# TextEdit
# -------------------------------------
# Use plain text as default
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit ShowRuler -int 0


# Kill affected apps
for app in \
    "Dock" \
    "Mail" \
    "Photos" \
    "SystemUIServer" \
    "cfprefsd" \
    "TextEdit" \
    "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."
