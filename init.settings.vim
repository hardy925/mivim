" Tab shizzle
set tabstop=2
set shiftwidth=2
set smartindent
" don't convert tabs to spaces!
set noexpandtab

" search smartly, if it contains a capital letter 
" use case sensitive search otherwise use case insensitive search
set ignorecase
set smartcase

" Search as you type the query
set incsearch

" show row numbers
set relativenumber

" by default '0' is the current line number in the margin
set number

" Enable mouse control
set mouse=a

" Enable custom color theme
set background=dark

" Enable true colour mode
set termguicolors
silent! colorscheme monokai

" Make it highlight red when I go beyond 80 lines.
"match Error /\%91v.\+/
" Add a bar which marks the 80th character
set colorcolumn=80

" Close the current buffer without closing the window.
command Bd bp|bd #

" Buffer delete all others (delete all except current one)
command Bdo BufOnly

" Send to system clipboard by default
set clipboard=unnamedplus

" Perl not provided
let g:loaded_perl_provider = 0

" ruby not provided
let g:loaded_ruby_provider = 0

" CtrlP ignore node_modules by default to make searching faster
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](node_modules|\.git|dist)$'
	\ }

let g:airline_powerline_fonts = 1

" Add a alias for NERDTree
command T NERDTreeToggle
command F NERDTreeFind
let g:NERDTreeMouseMode = 3
let g:NERDTreeShowHidden = 1

" Show the buffers at the top
let g:airline#extensions#tabline#enabled = 1

" Show the buffer numbers so I can `:b 1`, etc
let g:airline#extensions#tabline#buffer_nr_show = 1

" Aside from the buffer number, I literally just need the file name, so
" strip out extraneous info.
let g:airline#extensions#tabline#fnamemod = ':t'

" Set the theme for vim-airline
autocmd VimEnter * AirlineTheme powerlineish

" Use spaces instead just for yaml
autocmd Filetype yaml setl expandtab

" Enable marker based folding
set foldmethod=marker

set nofoldenable

set ls=3

" netrw file browser customizations
let g:netrw_banner=0 " disable banner
let g:netrw_browse_split=4 " Open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()

" git lens
let g:blamer_enabled = 1
let g:blamer_delay = 350
let g:blamer_prefix = ' -- '

" Make clearing the last used search pattern easy
"
nnoremap <silent> q, :let @/ = ""<CR>

" Execute the passed search command, but check has the last used
" search pattern been cleared and do nothing in that case, to fix
" a weird search misbehavior when searching forward or backward
" is performed after clearing the search pattern
"
function! ExecuteSearch(command)
  if strlen(@/) > 0
    execute "normal! " .. a:command
  endif
endfunction

nnoremap <silent> n :call ExecuteSearch("n")<CR>
nnoremap <silent> N :call ExecuteSearch("N")<CR>

" nice git messages
autocmd Filetype gitcommit setl colorcolumn=72
