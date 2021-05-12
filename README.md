# Installation

## macOS
1. Install [Homebrew](https://brew.sh/)  
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install all dependencies from the `Brewfile` through [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand)  
   ```bash
   curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/Brewfile > /tmp/Brewfile && brew bundle --file /tmp/Brewfile ; rm /tmp/Brewfile
   ```
3. Copy `.zshrc` file to home directory  
   ```bash
   curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/.zshrc > ~/.zshrc
   ```
4. Copy `.p10k.zsh` file to home directory
   ```bash
   curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/.p10k.zsh > ~/.p10k.zsh
   ```

5. Reload Zsh configuration  
   ```bash
   zsh
   ```
