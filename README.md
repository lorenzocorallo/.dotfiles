# .dotfiles

This repo contains my dotfiles to get everything working on new setups.\
Both configurations and structure working is inspired by [ThePrimeagen's dotfiles](https://github.com/ThePrimeagen/.dotfiles).

### Usage
It's a classic symbolic link dotfiles repo, but it uses `stow` to manage all the links in once.

There are two scripts to either `install` and `clean` the environment.\
Use `chmod +x ./install ./clean_env` to make them executable and then run `./install` or `./clean_env` based on the operation you wanna do.
NOTE: the scripts will install packages and stuffs, so check them before executing.

