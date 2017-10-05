# My Vim Configuration

Main features:

* Sublime-like "find in files" search
* FZF-powered fuzzy file search, with git files and history
* Tab-style windows
* A lot of custom remappings

## Setup

Run `~/install.sh`, which will set up symlinks for `~/.vimrc` and `~/.vim` to
directories here.

Plugins will be installed via vim-plug once you start vim.

## TODO

* [ ] Only restore session if vim is opened without any arguments. Profile the
      effect of this on startup time.

## Wishlist

* [ ] Session autosave and load based on git branch
* [ ] PR creation inside git
* [ ] Autosave
* [ ] Better async linting
* [ ] File explorer / opener inside a window, instead of sidebar
* [ ] Sublime-style search that shows context
* [ ] Better quickfix list and location list commands
