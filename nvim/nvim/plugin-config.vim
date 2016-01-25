" NERDTree
" Default commands:
""C-j (NERDTree): Jump to next sibling
""C-k (NERDTree): Jump to previous sibling
""p (NERDTree): Jump to parent
""o (NERDTree): Open node
""O (NERDTree): Recursively open node
""r (NERDTree): Refresh node
""R (NERDTree): Refresh root node

" Basically, disable these because I don't need them and they conflict with my
" remappings
" Jumping to first/last child isn't useful because we have `gg` and `G`
let NERDTreeMapJumpFirstChild='\K'
let NERDTreeMapJumpLastChild='\J'
" Lets you toggle showing files vs just directories - useless
let NERDTreeMapToggleFiles='\F'
" I don't use bookmarks
let NERDTreeMapDeleteBookmark='\D'
let NERDTreeMapMenu='~'
