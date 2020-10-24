" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
		set diffexpr=MyDiff()
endif
function MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg1 = substitute(arg1, '!', '\!', 'g')
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg2 = substitute(arg2, '!', '\!', 'g')
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		let arg3 = substitute(arg3, '!', '\!', 'g')
		if $VIMRUNTIME =~ ' '
				if &sh =~ '\<cmd'
						if empty(&shellxquote)
								let l:shxq_sav = ''
								set shellxquote&
						endif
						let cmd = '"' . $VIMRUNTIME . '\diff"'
				else
						let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
				endif
		else
				let cmd = $VIMRUNTIME . '\diff'
		endif
		let cmd = substitute(cmd, '!', '\!', 'g')
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
		if exists('l:shxq_sav')
				let &shellxquote=l:shxq_sav
		endif
endfunction

" Added code

set number numberwidth=1 tabstop=4
colorscheme desert

let mapleader = "," " leader for commands
let maplocalleader = "!" " leader for local commands

set laststatus=2 " Always display a status line

set statusline=--\ File:%f " displaying filename
set statusline+=\ (%Y) " displaying filetype
set statusline+=\ %m " displaying modified flag
set statusline+=%= " switching to right side
set statusline+=Line:%l/%L " displaying line numbers
set statusline+=\ \ -- " displaying fancy end
" remaps with leaders
nnoremap <leader>ev :vsplit<space>$MYVIMRC<cr> " Edit .vimrc quickly
nnoremap <leader>sv :source<space>$MYVIMRC<cr> " Source it quickly
vnoremap <leader>ev :vsplit<space>$MYVIMRC<cr> " Edit .vimrc quickly 
vnoremap <leader>sv :source<space>$MYVIMRC<cr> " Source it quickly
nnoremap <leader>d dd " delete current line
nnoremap <leader>c ddO " delete current line and create another blank line
vnoremap <leader>" <esc>`<i"<esc>`>i"<esc>v " Quote around the selection
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel " Quote the current word
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel " Simple Quote the current word
nnoremap <leader>i gg=G " Indent all buffer
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr> "  grep something and display it in quickfix list 
nnoremap <leader>f :call ToggleTabSize()<cr> " Tab size toggler
" remap without leaders
inoremap sd <esc>
vnoremap sd <esc>
" no operations
inoremap <esc> <NOP> " Disabling esc
vnoremap <esc> <NOP> " Dissabling esc
noremap   <Up>     <NOP> " Disabling arrow keys
noremap   <Down>   <NOP> " Disabling arrow keys
noremap   <Left>   <NOP> " Disabling arrow keys
noremap   <Right>  <NOP> " Disabling arrow keys
" Other maps
nnoremap // 0i//<space><esc> " To comment a line wherever you are on it 
nnoremap <c-u> wvbU<esc> " Upper case the word under the cursor
noremap <c-d> dd " Delete the current line
noremap <c-a> ggvG$ " Select the whole buffer
vnoremap <c-a> ggvG$ " Same as above but in vmode
nnoremap H 0 " Remaping go to the beggining of the line
nnoremap L $ " Remaping go to the end of the line
vnoremap H 0 " Remaping go to the beggining of the line
vnoremap L $ " Remaping go to the end of the line
nnoremap is <c-w>> " Size up current split
nnoremap ds <c-w>< " Size down current split

iabbrev @@ wafelack@protonmail.com      " email abbreviation
iabbrev web https://wafelack.fr  " website abbreviation
augroup filetype_rust " Rust cmd group
		autocmd!
		autocmd FileType rust :iabbrev <buffer> mut let<space>mut<space> " Completion to create let mut with just mut
		autocmd FileType rust :iabbrev <buffer> trt pub<space>trait<space> " Completion to create pub trait with trt 
augroup END

function! ToggleTabSize() " Function to change tab size
		if &tabstop == 4
				set tabstop=2
		else
				set tabstop=4
		endif
endfunction

" Desabing *~ & *.swp files

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set nowritebackup

" Plugins
execute pathogen#infect() 
