# Tim Breeze

A simple shell aliases utility inspired by SCM Breeze, providing convenient shortcuts for common Git commands. Use Git commands directly without the `git` prefix!

I had problems with scm breeze scripts breaking git commands for Claude Code. This approach works with Claude Code (once you have installed and restarted your terminal).

## Installation

1. Clone or download this repository
2. Run the installation script:
   ```bash
   ./install.sh
   ```
3. refresh your terminal:
   ```bash
    # e.g: for zsh
    source ~/.zshrc
   ```

The installer will automatically detect your shell (Bash/Zsh) and add the aliases to the appropriate RC file (.bashrc, .bash_profile, or .zshrc).

## Available Aliases

### Core Git Operations

- `gs` - git status
- `ga` - git add
- `gaa` - git add --all
- `gap` - git add --patch
- `gau` - git add --update

### Commit Operations

- `gc` - git commit
- `gca` - git commit --all
- `gcm` - git commit --amend
- `gcmh` - git commit --amend --no-edit
- `gch` - git commit --no-verify

### Branch & Checkout

- `gco` - git checkout
- `gb` - git branch
- `gba` - git branch --all
- `gbm` - git branch --move
- `gbd` - git branch --delete
- `gbD` - git branch -D (force delete)

### Diff Operations

- `gd` - git diff
- `gdc` - git diff --cached
- `gdw` - git diff --word-diff

### Log Operations

- `gl` - git log --oneline --graph --decorate
- `gla` - git log --oneline --graph --decorate --all
- `gll` - git log (detailed format with colors)

### Remote Operations

- `gf` - git fetch
- `gfa` - git fetch --all
- `gpl` - git pull
- `gplr` - git pull --rebase
- `gps` - git push
- `gpsf` - git push --force-with-lease

### Reset Operations

- `gr` - git reset
- `grh` - git reset --hard
- `grsl` - git reset HEAD~1

### Rebase Operations

- `grb` - git rebase
- `grbi` - git rebase --interactive
- `grbc` - git rebase --continue
- `grba` - git rebase --abort

### Merge Operations

- `gm` - git merge
- `gmnff` - git merge --no-ff
- `gmff` - git merge --ff-only

### Other Operations

- `gcl` - git clone
- `gcp` - git cherry-pick
- `gst` - git status --porcelain
- `gss` - git status --short
- `gce` - git clean
- `gcef` - git clean -fd
- `gsh` - git show
- `gsf` - git show --name-only

### Utility Aliases

- `unstage` - git reset HEAD --
- `last` - git log -1 HEAD
- `visual` - gitk
- `git-aliases` - shows all Tim Breeze aliases

## Viewing Your Aliases

To see all Tim Breeze aliases:

```bash
git-aliases
```

## How Shell Aliases Work

**Shell aliases are loaded automatically** when you start a new terminal session. Here's how it works:

- Aliases are defined in `tim_breeze_aliases.sh`
- The install script adds a source line to your shell RC file (.bashrc, .bash_profile, or .zshrc)
- They're loaded every time you start a new terminal session
- **No `git` prefix needed** - just type `gs`, `ga`, `gd`, etc. directly
- They work in any directory, with any Git repository

## Quick Start

After installation, you can immediately use shortcuts like:

```bash
gs          # instead of git status
ga .        # instead of git add .
gc "message" # instead of git commit "message"
gps         # instead of git push
```

## Uninstalling

### Easy Way - Use the Uninstall Script

Run the uninstall script to remove Tim Breeze from your shell configuration:

```bash
./uninstall.sh
```

This will:

- Remove the source line from your shell RC files
- Unset all Tim Breeze aliases from your current shell session

### Manual Method

Remove the Tim Breeze source line from your shell RC file:

```bash
# Remove from .zshrc, .bashrc, or .bash_profile
source "/path/to/tim_breeze/tim_breeze_aliases.sh"
```

## Credits

This utility is inspired by [SCM Breeze](https://github.com/scmbreeze/scm_breeze?tab=readme-ov-file#updating), an excellent Git workflow enhancement tool. Tim Breeze provides a simplified, Claude Code-compatible alternative focused on essential Git aliases.
