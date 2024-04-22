# Scoop Script

This repository contains a PowerShell script for setting up Scoop, a command-line installer for Windows. The script automates the installation of various packages using Scoop, making it easier to set up your development or everyday use environment on a new Windows machine.

## Prerequisites

Before running the script, ensure you have the following installed:

- Windows PowerShell
- Scoop (if not installed, the script will automatically install Scoop for you)

## Usage

1. Clone this repository to your local machine.
2. Open Windows PowerShell with administrative privileges.
3. Navigate to the directory where the script is located.
4. Run the script by entering `.\scoop_script.ps1`.

## Features

- Automatically adds Scoop buckets for additional package sources.
- Installs essential packages from the main, extras, games, and nerd-fonts Scoop buckets.
- Provides a user-friendly menu for listing available packages and installing them.
- Supports quick installation of all listed packages with a single command.

## Menu Options

1. **List all packages**: Displays a list of all available packages across different Scoop buckets.
2. **Install packages**: Installs all listed packages automatically.
3. **Quit**: Exits the script.

## Customization

- You can customize the `$mainBucket`, `$extrasBucket`, `$gamesBucket`, and `$nerdFontsBucket` arrays in the script to include or exclude specific packages based on your preferences.
- Modify the `$scoopBuckets` array to add or remove additional Scoop buckets.
- Feel free to extend or modify the script to suit your specific needs.
