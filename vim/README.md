# My Vim Configuration

Main features:

* Sublime-like "find in files" search
* Unite-powered fuzzy file search and most recently used list
* Windows which auto-maximize vertically
* A large number of custom remappings for easier navigation

## Setup

My `.vimrc` is stored in the `.vim` folder, [here](vimrc). To use it, replace
the contents of `~/.vimrc` with:

`source ~/.vim/vimrc`

For now, my sublime-like search depends on a couple of custom scripts (in the
`scripts` directory). You'll need to make sure they are both executable, and
their path must be `~/.vim/scripts`.

Plugins must be individually installed - see the next section.

## Plugins

I use Pathogen for dependencies, which doesn't seem to be a great fit for
keeping things in version control. At some point I'll probably switch to
another package manager; for now, here's a list of my plugins. Each of these
should be installed to the `~/.vim/bundle` folder.

* ag
* mustache
* neomru.vim
* nerdcommenter
* nerdtree
* unite.vim
* vim-coffee-script
* vim-fugitive
* vim-less
* vim-markdown
* vim-misc
* vim-nerdtree-tabs
* vim-session
* vim-surround
* vim-windowswap
* vimproc.vim

