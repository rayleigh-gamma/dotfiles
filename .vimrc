call plug#begin()

Plug 'rayleigh-gamma/caramel.vim'
Plug 'rayleigh-gamma/c.vim'

call plug#end()

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
let c_comment_strings = 1
let c_no_bracket_error = 1
let c_no_curly_error = 1
let c_syntax_for_h = 1
let c_no_if0 = 1
let c_functions = 1
let c_function_pointers = 1

syntax enable
colorscheme caramel
filetype indent plugin on

set background=dark
set number
set cursorline
set termguicolors
set shiftwidth=4
set tabstop=4
set autoindent
set smarttab
set undofile
set undodir=~/.vim/undo
set incsearch
set formatoptions=cro
set textwidth=80

augroup vimStartup
	autocmd!
	autocmd VimEnter * silent execute "!printf '\\033[2 q' > /dev/tty"

	autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif
augroup END

augroup cmdlineCursor
	autocmd!
	autocmd CmdlineEnter * silent execute "!printf '\\033[4 q' > /dev/tty"
	autocmd CmdlineLeave * silent execute "!printf '\\033[2 q' > /dev/tty"
augroup END

augroup vimLeave
	autocmd!

	autocmd VimLeave * silent execute "!printf '\\033[4 q' > /dev/tty"
augroup END

nnoremap tt <Cmd>vertical botright terminal<Cr>
vnoremap <silent> <C-c> y:call system('clip.exe', @")<CR>
