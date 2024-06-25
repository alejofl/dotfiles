# Dotfiles

This repository contains my configuration files and some scripts to streamline the setup of a new machine.

All of the scripts and config files are aimed at macOS, but some of them may work on other Unix-like systems.

## Execution

* First, install Xcode Command Line Tools (Git) and Homebrew:

```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

* Install all apps and tools, configure ZSH and Git:

```bash
sudo ./install.sh
```
