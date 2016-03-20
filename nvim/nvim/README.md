# Neovim Config

A vim configuration optimized for working on large projects.

Heavily remaps vim's default commands into categories. At a high level, uses
SHIFT as a modifier key for commands that help with editing, and CTRL as a
modifier key for commands that switch between files.

This comes at a cost: since many of vim's core mappings are changed, this setup
is harder to drop into your vim configuration and try out. To compensate, I've
carefully organized the file structure and added a ton of documentation.
Hopefully it will be possible to adapt behaviors you want, with your own key
mappings, into your own vim config.


## Major Features

* Work with many files at once using Wintabs, NERDTree, and FZF to easily
  switch between them
* Pick up where you left off with session management
* Stop mashing `:w` and let autosave take care of saving files
* Run commands and switch files faster with a huge number of remapped commands,
  optimized for working in large projects. (Yes, I know this is controversial)


## Important Note on Documentation

I've remapped a lot of commands. To keep things sane, it's important to be able
to search through the remappings and check for conflicts.

Label all key remappings like this (note extra `"`):

```
""[X-]xx [(Context)]
" Description
```

Where:

* Optional `X-` is `C` for `<ctrl>`, or `L` for `<leader>`,
* `xx` is the combination being remapped,
* and optional `(Context)` is the filetype where the remapping is enabled.


## TODO

* Reload files when they change in the background
* Per-branch sessions
* Sublime style find-in-files
* Try out wellle/targets.vim
* Try out vim-angular
* Window grab / window swap
  * Reserved: C-x, C-c
* Show warning past line limit
* Configure backup files
* Add JSON syntax highlighter
