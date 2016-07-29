"pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() "call this when installing new plugins

syntax on
filetype plugin indent on

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a
set hlsearch

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

"set list listchars=trail:·,tab:\ \ 
set noswapfile
set nobackup
set wildmenu
set wildmode=full
set expandtab

" ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <C-]> :exec("tag ".expand("<cword>"))<CR>
map <C-@> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-^> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"colorscheme asmanian2

map <F8> :NERDTree<CR><C-W>l:q<CR>

"Load CCTree DB at vim startup
"autocmd VimEnter * if filereadable('cscope.out') | :CCTreeLoadDB cscope.out

let g:CCTreeOrientation = "rightbelow"

" Show line number
set number
highlight LineNr term=bold ctermfg=darkgray guifg=darkgray

" cscope maps
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" JavaScript (tab width 2 chars, wrap at 80)
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set softtabstop=2
autocmd FileType javascript set textwidth=80

autocmd FileType ragel set cindent
autocmd FileType c set cindent|set tabstop=2|set softtabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType cpp set cindent|set tabstop=2|set softtabstop=2|set shiftwidth=2|set noexpandtab

autocmd FileType python set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" statusbar
set laststatus=2
set statusline=
set statusline+=%f\                    " file name
set statusline+=%h%1*%m%r%w%0*         " flags
set statusline+=%=                     " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset

" syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_c_gcc_checker = 1
let g:syntastic_c_splint_checker = 1
let g:syntastic_c_make_checker = 1
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1

" let g:syntastic_c_no_include_search = 1
let g:syntastic_c_compiler_options = "
                        \ -Wunused-variable -Wunused-function -Wunused-label -Wunused-value
                        \ -Waddress -Warray-bounds -Wc++11-compat -Wchar-subscripts
                        \ -Wenum-compare -Wimplicit-int -Wimplicit-function-declaration
                        \ -Wcomment -Wformat -Wmain -Wmaybe-uninitialized
                        \ -Wmissing-braces -Wnonnull -Wparentheses -Wpointer-sign
                        \ -Wreorder -Wreturn-type -Wsequence-point -Wsign-compare
                        \ -Wstrict-aliasing -Wstrict-overflow=1 -Wswitch
                        \ -Wtrigraphs -Wuninitialized -Wunknown-pragmas
                        \ -Wvolatile-register-var -I$CPATH
                        \ "

set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
" colorscheme asmanian2
au BufReadPost *.hbs set syntax=html
set tags=./tags;../tags;../../tags;../../../tags
