#!/bin/bash

# Tim Breeze Shell Aliases
# Git shortcuts that work directly in the terminal (no 'git' prefix needed)

# Core Git operations
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gau='git add --update'

# Commit operations
alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --amend'
alias gcmh='git commit --amend --no-edit'
alias gch='git commit --no-verify'

# Checkout and branch operations
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch --all'
alias gbm='git branch --move'
alias gbd='git branch --delete'
alias gbD='git branch -D'

# Diff operations
alias gd='git diff'
alias gdc='git diff --cached'
alias gdw='git diff --word-diff'

# Log operations
alias gl='git log --oneline --graph --decorate'
alias gla='git log --oneline --graph --decorate --all'
alias gll='git log --graph --pretty=format:"%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Remote operations
alias gf='git fetch'
alias gfa='git fetch --all'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsf='git push --force-with-lease'

# Reset operations
alias gr='git reset'
alias grh='git reset --hard'
alias grsl='git reset HEAD~1'

# Rebase operations
alias grb='git rebase'
alias grbi='git rebase --interactive'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

# Merge operations
alias gm='git merge'
alias gmnff='git merge --no-ff'
alias gmff='git merge --ff-only'

# Other useful operations
alias gcl='git clone'
alias gcp='git cherry-pick'
alias gst='git status --porcelain'
alias gss='git status --short'
alias gce='git clean'
alias gcef='git clean -fd'
alias gsh='git show'
alias gsf='git show --name-only'

# Utility aliases
alias unstage='git reset HEAD --'
alias last='git log -1 HEAD'
alias visual='gitk'

# Tim Breeze specific utilities
alias git-aliases='alias | grep "git" | sort'