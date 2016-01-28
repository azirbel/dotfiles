# Neovim Config

## Major Features

* Wintabs
* NERDTree
* FZF file search
* YouCompleteMe
* Autosave
* Session management
* Many remappings
* Passive checking tools
  * Syntastic
  * GitGutter

## Important Note on Documentation

I've remapped a lot of commands. To keep things sane, it's important to be able
to search through the remappings and check for conflicts.

Label all key remappings like this (note extra "):

```
" [X-]xx [(Context)]
" Description
```

Where:

* Optional `X-` is `C` for `<ctrl>`, or `L` for `<leader>`,
* `xx` is the combination being remapped,
* and optional `(Context)` is the filetype where the remapping is enabled.

## TODO

* Per-branch sessions
* Sublime style find-in-files
* vim-over
* wellle/targets.vim
* vim-angular
* vim-surround
* Window grab / window swap
  * C-x, C-c
* Favorites
  * C-u, C-y
* Show warning past line limit
* Configure backup files
* https://github.com/mattn/gist-vim
* JSON syntax highlighter
