# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Tim Breeze is a shell aliases utility that provides Git command shortcuts (e.g., `gs` for `git status`). The project consists of:

- `tim_breeze_aliases.sh` - Core alias definitions
- `install.sh` - Interactive installer with shell detection and multi-shell support
- `uninstall.sh` - Comprehensive uninstaller that cleans RC files and current session
- `README.md` - Complete documentation with all available aliases

## Architecture

This is a pure shell utility with no build system or dependencies. The architecture is:

1. **Alias Definition**: All Git shortcuts are defined as bash aliases in `tim_breeze_aliases.sh`
2. **Installation**: `install.sh` detects shell type (Zsh/Bash) and OS (macOS/Linux) to source aliases in the correct RC file
3. **Integration**: Aliases are loaded automatically on new shell sessions via sourcing from RC files

## Common Development Commands

Since this is a shell utility with no build system:

- **Test installation**: `./install.sh` (interactive installer)
- **Test functionality**: Source aliases manually: `source ./tim_breeze_aliases.sh`
- **Verify aliases**: `git-aliases` (shows all Tim Breeze aliases)
- **Test uninstall**: `./uninstall.sh`
- **Check shell compatibility**: Test in both Bash and Zsh environments

## Key Implementation Details

- Cross-platform shell detection (handles macOS vs Linux differences for Bash profiles)
- Idempotent installation (checks if already installed before modifying RC files)
- Complete cleanup on uninstall (removes both RC file entries and current session aliases)
- All aliases use full git commands internally for compatibility
- Interactive installer allows manual shell selection or auto-detection

## Shell Compatibility

The utility supports:
- **Zsh**: Uses `.zshrc`
- **Bash on Linux**: Uses `.bashrc`  
- **Bash on macOS**: Uses `.bash_profile`
- Auto-detection falls back to adding to multiple files if shell type unclear