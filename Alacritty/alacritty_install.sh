#!/bin/bash

# Alacritty install script
# Created By: @LinuxUser255 (Chris)
# License: GNU GPLv3

# Install shell script for the Alacritty Terminal emulator on Debian & Debian-based distros
# the goal is to have a one & done easy install for the end user
#
# To-Do
#----------------------------------------------------------------------------------------
# make sure to include an alacritty.toml config and make the .config/alacritty dir for it.
# that should be the last step in the Prebuild process
# integrate the source $HOME/.cargo/env in the rust compiler install function.
# call all functions in a main function
# replace all echos with printf in bold red: printf "\e[1;31m Messg here \e[0m\n"
# Make obvious what part of the script is executing and when
# printf "\e[1;31m Messg here \e[0m\n"
# Another dependency to install: scdoc
#---------------------------------------------------------------------------------------

# This is a 2 part install Process:

# Pre-build, and Post-build
#
# Part 1: Prebuild
# First check for sudo privileges, and if so, then proceede
# Check for and install Dependencies
# Install the Rust compiler
# Source the cargo environment.
# Clone the Alacritty source code
# Build Alacritty from source.
# create the .config/alacritty directory and place the example config file in it
#
# Part 2: Post-build
# Post Build Alacritty Configurations
# checking Terminfo
# Creating a Desktop Entry
# Create The Manual page
# Enable Shell completions for Zsh, Bash, and Fish


#-------------Part 1: Pre-build-------------------------------------------------------#

#
# First check for sudo privileges, and if so, then proceede
check_and_install_packages() {
    # Check if the user has sudo privileges
    if ! sudo -n true > /dev/null 2>&1; then
        printf "\e[1;31m Sudo privileges required. \e[0m\n"
        exit 1
    fi

    echo "Conducting full system update and upgrade"
    sudo apt update && sudo apt upgrade;

    # List of packages to install
    packages=(
        curl
        git
        cmake
        scdoc
        pkg-config
        libfreetype6-dev
        libfontconfig1-dev
        libxcb-xfixes0-dev
        libxkbcommon-dev
        python3
)
 # Check if packages are already installed
    printf "\e[1;31m Checking dependences \e[0m\n"
    missing_packages=()
    for package in "${packages[@]}"; do
        if ! dpkg -l | grep -q "^ii\s*$package\s"; then
            missing_packages+=("$package")
        fi
    done

    if [ ${#missing_packages[@]} -eq 0 ]; then
        printf "\e[1;31m Dependencies already installed \e[0m\n"
    else
        printf "\e[1;31m Installing missing packages... \e[0m\n"
        sudo apt update
        sudo apt install -y "${missing_packages[@]}"
        echo "Installation complete."
    fi
}

# Install rustup and its compiler
install_rustup_and_compiler() {
    printf "\e[1;31m Installing rustup and its compiler... \e[0m\n"

    # Install rustup and the Rust compiler
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Source the cargo enviroment
    source $HOME/.cargo/env

    printf "\e[1;31m Rustup and its compiler installed successfully.\e[0m\n"
}

# Cloning & building from source
install_alacritty() {
    printf "\e[1;31mInstalling Alacritty\e[0m\n"

    # Clone Alacritty repository
    git clone https://github.com/alacritty/alacritty.git

    # Need to ensure that necssary cmds are executed in this dir
    # Enter the Alacritty directory
    cd alacritty

    # Build Alacritty
    cargo build --release
}

# Function to download alacritty.toml file and move it to ~/.config/alacritty
download_and_move_alacritty_config() {
    printf "\e[1;31mDownloading alacritty.toml file...\e[0m\n"

    # Download alacritty.toml file using curl
    # My custom config
    #curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Alacritty/alacritty.toml

    # a generic config
    curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Alacritty/configs/alacritty.toml

    printf "\e[1;31mCreating ~/.config/alacritty directory if it doesn't exist...\e[0m\n"

    # Create the ~/.config/alacritty directory if it doesn't exist
    mkdir -p ~/.config/alacritty

    printf "\e[1;31mMoving the downloaded alacritty.toml file to ~/.config/alacritty...\e[0m\n"

    # Move the downloaded alacritty.toml file to ~/.config/alacritty
    mv alacritty.toml ~/.config/alacritty/

    printf "\e[1;31mAlacritty configuration file downloaded and moved successfully.\e[0m\n"
}

#-------------Part 2: Post-build-------------------------------------------------------#

# Verify and install terminfo for Alacritty
verify_and_install_terminfo() {
    printf "\e[1;31mVerifying terminfo installation for Alacritty...\e[0m\n"

    # Check if terminfo for Alacritty is installed
    if infocmp alacritty &> /dev/null; then
        printf "\e[1;31mTerminfo for Alacritty is installed.\e[0m\n"
    else
        printf "\e[1;31mTerminfo for Alacritty is not installed. Installing globally...\e[0m\n"
        # Install terminfo globally
        sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
        printf "\e[1;31mTerminfo installed successfully.\e[0m\n"
    fi
}


# Create a Desktop entry for Alacritty
create_desktop_entry() {
    echo "Installing Alacritty..."

    # Change directory to the Alacritty directory
    cd ~/alacritty || { echo "Error: Alacritty directory not found."; exit 1; }

    # Copy Alacritty binary to /usr/local/bin
    sudo cp target/release/alacritty /usr/local/bin || { echo "Error: Failed to copy Alacritty binary."; exit 1; }

    # Copy Alacritty logo to /usr/share/pixmaps/
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg || { echo "Error: Failed to copy Alacritty logo."; exit 1; }

    # Install Alacritty Desktop entry
    sudo desktop-file-install extra/linux/Alacritty.desktop || { echo "Error: Failed to install Alacritty Desktop entry."; exit 1; }

    # Update desktop database
    sudo update-desktop-database || { echo "Error: Failed to update desktop database."; exit 1; }

    echo "Alacritty installed successfully."
}


# Create the Alacritty manual page
create_alacritty_manual_page() {
    echo "Creating Alacritty manual page..."

    # Change directory to the Alacritty directory
    cd ~/alacritty || { echo "Error: Alacritty directory not found."; exit 1; }

    # Create alacritty manual page directory if it doesn't exist
    sudo mkdir -p /usr/local/share/man/man1 || { echo "Error: Failed to create manual page directory."; exit 1; }

    # Create and install alacritty manual pages
    sudo sh -c "gzip -c extra/alacritty.man | tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null" || { echo "Error: Failed to create alacritty manual page."; exit 1; }
    sudo sh -c "gzip -c extra/alacritty-msg.man | tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null" || { echo "Error: Failed to create alacritty-msg manual page."; exit 1; }

    echo "Alacritty manual pages created and installed successfully."
}


# Implement automatic completions for Alacritty's flags and arguments
implement_completions() {
    printf "\e[1;31m Implementing auto completions for Alacritty's flags and args \e[0m\n"

    # Check which shell is in use: Zsh, Bash, Fish
    if [ -n "$ZSH_VERSION" ]; then
        # If Zsh, install completions for zsh
        printf "\e[1;31m Detected Zsh shell. \e[0m\n"

        # Create directory for Zsh completions if not already present
        mkdir -p ${ZDOTDIR:-~}/.zsh_functions
        echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc

        # Copy completion file to Zsh directory
        cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

    elif [ -n "$BASH_VERSION" ]; then
        # If Bash, install completions for bash
        printf "\e[1;31m Detected Bash \e[0m\n"

        # Source the completion file in ~/.bashrc
        echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc

    elif [ -n "$fish" ]; then
        # If Fish, install completions for fish
        printf "\e[1;31m Detected the Fish shell. \e[0m\n"

        # Get Fish completion directory
        fish_complete_path=(`echo $fish_complete_path`)

        # Create directory for Fish completions if not already present
        mkdir -p $fish_complete_path[1]

        # Copy completion file to Fish directory
        cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish

    else
        printf "\e[1;31m Unsupported shell. Please configure completions manually.\e[0m\n"
        exit 1
    fi

    echo "Automatic completions for Alacritty's flags and arguments implemented successfully."
    printf "\e[1;31m Automatic completions for Alacritty's flags and arguments implemented successfly. \e[0m\n"
}


# Execute script with the main function
main() {
    printf "\e[1;31m Starting the install script. \e[0m\n"

    check_and_install_packages

    install_rustup_and_compiler

    install_alacritty

    download_and_move_alacritty_config

    verify_and_install_terminfo

    create_desktop_entry

    create_alacritty_manual_page

    implement_completions

    printf "\e[1;31m Installation complete. \e[0m\n"
}
