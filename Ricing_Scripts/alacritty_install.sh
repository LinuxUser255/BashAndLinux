#!/bin/bash

# Install shell script for the Alacritty Terminal emulator on Debian & Debian-based distros
# the goal is to have a one & done easy install for the end user
# https://alacritty.org/

# Goals & other info
#------------------------
# 1.  Automate the install process found online
# 2.  Also, provide/install a config --> alacritty.toml, something that Alacritty doesn't provide
# 3.  Long-term, give this script the ability to be used to install alac on mac too
#     This script is being tested on a Kali Linux VM, cause I dont feel like screwing around with
#     the alacritty install on my machine
#


# First check for sudo privileges, and if so, then proceede
check_and_install_packages() {
    # Check if the user has sudo privileges
    if ! sudo -n true > /dev/null 2>&1; then
        echo "This script requires sudo privileges to proceede."
        exit 1
    fi

    echo "Conducting full system update and upgrade"
    sudo apt update && sudo apt upgrade;

    # List of packages to install
    packages=(
        curl
        git
        cmake
        pkg-config
        libfreetype6-dev
        libfontconfig1-dev
        libxcb-xfixes0-dev
        libxkbcommon-dev
        python3
)
 # Check if packages are already installed
    echo "Checking depedencies"
    missing_packages=()
    for package in "${packages[@]}"; do
        if ! dpkg -l | grep -q "^ii\s*$package\s"; then
            missing_packages+=("$package")
        fi
    done

    if [ ${#missing_packages[@]} -eq 0 ]; then
        echo "All packages are already installed."
    else
        echo "Installing missing packages..."
        sudo apt update
        sudo apt install -y "${missing_packages[@]}"
        echo "Installation complete."
    fi
}
# Call the function to check sudo privileges and install software
#check_and_install_packages


# Install rustup and its compiler
install_rustup_and_compiler() {
    echo "Installing rustup and its compiler..."

    # Install rustup and the Rust compiler
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    echo "Rustup and its compiler installed successfully."
}
# Call the function to install rustup and its compiler
#install_rustup_and_compiler


# Cloning & building from source
echo "Now cloning the Alacritty source code"
# Function to install Alacritty - build from source
install_alacritty() {
    printf "\e[1;31mInstalling Alacritty\e[0m\n"

    # Clone Alacritty repository
    git clone https://github.com/alacritty/alacritty.git

    # Change directory to Alacritty
    cd alacritty

    # Build Alacritty
    cargo build --release
}
# Call the function to install Alacritty
#install_alacritty


# Check for the binary placement
# ls -la target/release/alacritty
# Function to check binary placement and proceed with post-build process
check_and_proceed() {
    echo "Checking binary placement of Alacritty:"
    if [ -f "target/release/alacritty" ]; then
        echo "Alacritty binary found."
        # Proceed with post-build process
        post_build_process
    else
        echo "Alacritty binary not found. Aborting post-build process."
    fi
}
# Call the function to check binary placement and proceed with post-install process
#check_and_proceed


# Function for post-build process
post_build_process() {
    echo "Proceeding with Alacritty post-build process..."
    # post-build steps
    # Ensure that the user is still inside the Alacritty repo
    if [ ! -f "extra/alacritty.info" ]; then
        echo "Alacritty terminfo file (extra/alacritty.info) not found."
        echo "Please make sure you are inside the Alacritty repository."
        exit 1
    fi

    # If the command `infocmp alacritty` returns without any errors, then the Alacritty terminfo is already installed
    if infocmp alacritty &> /dev/null; then
        echo "Alacritty terminfo is already installed."
    else
        # If it is not present already, install it globally
        echo "Installing Alacritty terminfo globally..."
        sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
        echo "Alacritty terminfo installed successfully."
    fi
}
# Calling the post-build function.
#post_build_process(


# Function to create a Desktop entry for Alacritty
create_desktop_entry() {
    echo "Creating a Desktop entry for Alacritty..."

    # Copy Alacritty binary to /usr/local/bin or any other location in $PATH
    sudo cp target/release/alacritty /usr/local/bin

    # Copy Alacritty logo to /usr/share/pixmaps/
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg

    # Install the Alacritty Desktop entry
    sudo desktop-file-install extra/linux/Alacritty.desktop

    # Update desktop database
    sudo update-desktop-database

    echo "Desktop entry for Alacritty created successfully."
}
# Call the function to create the Desktop entry for Alacritty
#create_desktop_entry


# Install the Manual page for Alacritty
install_manual_page() {
    echo "Installing the Manual page for Alacritty..."

    # Create directories for manual pages
    sudo mkdir -p /usr/local/share/man/man1
    sudo mkdir -p /usr/local/share/man/man5

    # Install Alacritty manual pages
    scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
    scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
    scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

    echo "Manual page for Alacritty installed successfully."
}
# Call the function to install the Manual page for Alacritty
#install_manual_page


# Function to implement automatic completions for Alacritty's flags and arguments
implement_completions() {
    echo "Implementing automatic completions for Alacritty's flags and arguments..."

    # Check which shell is in use: Zsh, Bash, Fish
    if [ -n "$ZSH_VERSION" ]; then
        # If Zsh, install completions for zsh
        echo "Detected Zsh shell."

        # Create directory for Zsh completions if not already present
        mkdir -p ${ZDOTDIR:-~}/.zsh_functions
        echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc

        # Copy completion file to Zsh directory
        cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

    elif [ -n "$BASH_VERSION" ]; then
        # If Bash, install completions for bash
        echo "Detected Bash shell."

        # Source the completion file in ~/.bashrc
        echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc

    elif [ -n "$fish" ]; then
        # If Fish, install completions for fish
        echo "Detected Fish shell."

        # Get Fish completion directory
        fish_complete_path=(`echo $fish_complete_path`)

        # Create directory for Fish completions if not already present
        mkdir -p $fish_complete_path[1]

        # Copy completion file to Fish directory
        cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish

    else
        echo "Unsupported shell. Please configure completions manually."
        exit 1
    fi

    echo "Automatic completions for Alacritty's flags and arguments implemented successfully."
}
# Call the function to implement automatic completions
#implement_completions


# Execute script with the main function
main() {

# Call the function to check sudo privileges and install software
check_and_install_packages

# Call the function to install rustup and its compiler
install_rustup_and_compiler

# Call the function to install Alacritty
install_alacritty

# Call the function to check binary placement and proceed with post-install process
check_and_proceed

# Calling the post-build function.
post_build_process(

# Call the function to create the Desktop entry for Alacritty
create_desktop_entry

# Call the function to install the Manual page for Alacritty
install_manual_page

# Call the function to implement automatic completions
implement_completions

}

# Calling the main function to start script execution
main







