#!/bin/bash

# Function to disable relative dates and set custom date format
disable_relative_dates() {
    # Disable relative dates in Finder
    defaults write com.apple.finder RelativeDates -bool false

    # Set custom global date formats for various scenarios
    defaults write NSGlobalDomain AppleICUDateFormatStrings -dict-add \
        "1" "yyyy-MM-dd HH:mm" \
        "2" "yyyy-MM-dd HH:mm:ss" \
        "3" "yyyy-MM-dd HH:mm:ss" \
        "4" "yyyy-MM-dd HH:mm:ss"

    # Restart Finder to apply changes
    killall Finder

    echo "Relative dates disabled, and custom date formats set."
}

# Function to restore default settings
restore_default_settings() {
    # Restore Finder's default behavior for relative dates
    defaults delete com.apple.finder RelativeDates

    # Restore global default date formats
    defaults delete NSGlobalDomain AppleICUDateFormatStrings

    # Restart Finder to apply changes
    killall Finder

    echo "Default settings restored."
}

# Optionally: Check if relative dates are already disabled and prevent redundant changes
if [[ $(defaults read com.apple.finder RelativeDates) -eq 0 ]]; then
    echo "Relative dates are already disabled."
else
    disable_relative_dates
fi

# Optionally: Uncomment the following line if you want to restore the default settings.
# restore_default_settings
