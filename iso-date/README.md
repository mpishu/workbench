## Overview

macOS, by default, displays relative dates (e.g., "yesterday", "2 days ago") in Finder. This script provides a way to **disable this behavior** and set **custom date formats** in a consistent, machine-readable format.

The script also allows you to **restore the default date settings** for both Finder and system-wide date formats.

## Requirements

- macOS (any version that supports `defaults` and Finder)
- Terminal access

## Usage

### Disable Relative Dates

To **disable relative dates** and set the custom date formats (`yyyy-MM-dd HH:mm` or `yyyy-MM-dd HH:mm:ss`), run the script as follows:

1. Open **Terminal**.
2. Navigate to the directory containing the script.
3. Run the script:

   ```bash
   ./script.sh


This will disable relative dates in Finder and set the global date format to `yyyy-MM-dd HH:mm` and `yyyy-MM-dd HH:mm:ss`.

#### Check Current Status

Before running, the script will check if relative dates are already disabled. If they're already disabled, it will notify you and skip the changes.

### Restore Default Settings

If you'd like to **restore the default settings**, uncomment the line in the script where `restore_default_settings` is called. This will reset the Finder relative date setting and revert the date formats back to their default values.

1. Open the script file (`script.sh`).

2. Uncomment the line:

   ```bash
   # restore_default_settings
   ```

3. Save the file and run the script again to restore the default settings.

------

## Functions

### `disable_relative_dates`

This function disables relative dates in Finder and sets the following custom date formats globally:

- `yyyy-MM-dd HH:mm`
- `yyyy-MM-dd HH:mm:ss`

It also restarts Finder to apply the changes.

### `restore_default_settings`

This function restores the default behavior:

- It re-enables relative dates in Finder.
- It restores the default global date formats.

It also restarts Finder to apply the changes.

------

## Examples

### Example 1: Disable Relative Dates and Set Custom Formats

1. Run the script to disable relative dates and set the custom formats:

   ```bash
   ./script.sh
   ```

2. After running the script, relative dates in Finder will be disabled, and the new date formats will take effect across the system.

### Example 2: Restore Default Settings

1. Open the script and uncomment the line for restoring default settings:

   ```bash
   restore_default_settings
   ```

2. Save the file and run the script again to restore the default behavior.

------

## License

This script is provided "as-is" and is free for personal or educational use. No warranties are expressed or implied.

------
