#!/usr/bin/env bash

# Alacritty install script
# Created By: @LinuxUser255 (Chris)
# License: GNU GPLv3

# Install shell script for the Alacritty Terminal emulator on Debian & Debian-based distros
#
# To-Do
#----------------------------------------------------------------------------------------
# The only two parts not working:
# man page and autoinstall of alacritty.toml in the ~/.config/alacritty directory
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

# First check for sudo privileges, and if so, then proceede
is_sudo() {
    if [ ${UID} -ne 0 ]; then
        # ! sudo -n true > /dev/null 2>&1; then
        printf "\e[1;31m Sudo privileges required. \e[0m\n"
        exit 1
    fi
}

# Install dependencies
check_and_install_packages() {

   #dependencies to check for
   packages=(
       curl
       git
       cmake
       scdoc
       neofetch
       ripgrep
       pkg-config
       libfreetype6-dev
       libfontconfig1-dev
       libxcb-xfixes0-dev
       libxkbcommon-dev
       python3
   )

    # Check if packages are already installed
    printf "\e[1;31m Checking dependencies \e[0m\n"
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
        sudo apt upgrade
        #echo "Installation complete."
        printf "\e[1;31m Installation complete. \e[0m\n"
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

   # configure your current shell
   source "$HOME/.cargo/env"

   # copy the alacritty binary to path
   sudo cp -r ~/target/release/alacritty /usr/local/bin

   printf "\e[1;31mAlacritty binary is installed\e[0m\n"
}

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

# Function to download alacritty.toml file and move it to ~/.config/alacritty
download_and_move_alacritty_config() {
    printf "\e[1;31mDownloading alacritty.toml file...\e[0m\n"

    # this part needs work, ther's only a default .yml being installed in /etc/xdg/alacritty
    # Download alacritty.toml file using curl
    # My custom config
    #curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Alacritty/alacritty.toml
    printf "\e[1;31mCreating ~/.config/alacritty directory if it doesn't exist...\e[0m\n"

    #mkdir  ~/.config/alacritty
    mkdir  "${XDG_CONFIG_HOME:-$HOME/.config/alacritty}"    # Move the downloaded alacritty.toml file to ~/.config/alacritty

    printf "\e[1;31mRetrieving the .toml file from Github alacritty.toml fil\e[0m\n"
    curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Alacritty/configs/alacritty.toml

    mv alacritty.toml -t ~/.config/alacritty/

    printf "\e[1;31mAlacritty configuration file downloaded and moved successfully.\e[0m\n"
}

#-------------Part 2: Post-build-------------------------------------------------------#

# Create a Desktop entry for Alacritty
create_desktop_entry() {
    echo "Creating desktop entry..."

    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database

    echo "Desktop entry installed successfully."
}

# Create the Alacritty manual page
create_alacritty_manual_page() {

    # This part's not working either
    echo "Creating Alacritty manual page..."
    printf "\e[1;31m Creating Alacritty manual page.\e[0m\n"

    # Change directory to the Alacritty directory
    #cd ~/alacritty || { echo "Error: Alacritty directory not found."; exit 1; }

    # Create alacritty manual page directory if it doesn't exist
    sudo mkdir -p /usr/local/share/man/man1 #|| { echo "Error: Failed to create manual page directory."; exit 1; }

    # Create and install alacritty manual pages
    sudo sh -c "gzip -c extra/alacritty.man | tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null" #|| { echo "Error: Failed to create alacritty manual page."; exit 1; }
    sudo sh -c "gzip -c extra/alacritty-msg.man | tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null" #|| { echo "Error: Failed to create alacritty-msg manual page."; exit 1; }

   # NOT working -> gzip: extra/alacritty.man: No such file or directory

    echo "Alacritty manual pages created and installed successfully."
}

# Implement automatic completions for Alacritty's flags and arguments
implement_completions() {
    printf "\e[1;31m Implementing auto completions for Alacritty's flags and args \e[0m\n"

    # Check which shell is in use: Zsh, Bash, Fish
    current_shell="$(neofetch | rg -i "zsh" | awk '{print $2}')"
    if [[ "$current_shell" = z* ]];
    then
        printf "\e[1;31m Detected Zsh shell. \e[0m\n"

    #if [ -n "$ZSH_VERSION" ]; then
    # If Zsh, install completions for zsh
    printf "\e[1;31m Detected Zsh shell. \e[0m\n"

        # Create directory for Zsh completions if not already present
        mkdir -p ${ZDOTDIR:-~}/.zsh_functions
        echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc

        # Copy completion file to Zsh directory
        cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

    elif current_shell="$(neofetch | rg -i "bash" | awk '{print $2}')"
    then
        # If Bash, install completions for bash
        printf "\e[1;31m Detected Bash \e[0m\n"

        # Source the completion file in ~/.bashrc
        echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc

    elif current_shell="$(neofetch | rg -i "fish" | awk '{print $2}')"
    then
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
    is_sudo

    check_and_install_packages

    install_rustup_and_compiler

    install_alacritty

    download_and_move_alacritty_config

    verify_and_install_terminfo

    create_desktop_entry

    create_alacritty_manual_page

    implement_completions
}

main
