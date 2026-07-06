# dotFiles

## macOS

### install homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### install configuration `install.sh`

Fetches each config over `curl` (nothing left on disk):

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/main/macOS/install.sh)"
```

### install with symlinks

Prefix `USE_SYMLINK=1` to clone the repo to `~/Documents/dotfiles` and symlink
the configs instead — later edits to the repo apply live:

```
USE_SYMLINK=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/main/macOS/install.sh)"
```
