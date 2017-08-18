" let d uses black hole register, so that the thing you delete will not be
" copied to clipboard
nnoremap D d
vnoremap D d
nnoremap DD dd
nnoremap d "_d
nnoremap dd "_dd
vnoremap d "_d
vnoremap p "_dP
nnoremap c "_c
vnoremap c "_c  

" change the key to go to the end of the line
map ; $

" quick way to exits the insert mode
imap jj <Esc>
imap kk <Esc>
" quick way to enter visual mode
imap vv <Esc>v

" when changing indentation, do not vanish the visual block
vmap > ><ESC>vgv
vmap < <<ESC>vgv

" use u and U to exits visual mode,
" because I never use convert to lower or upper case anyway
vmap u <Esc>
vmap U <Esc>

" use the shift enter to change line
imap <C-CR> <Esc>o

" use alt key to navigate without exit the insert mode
imap <A-j> <Down>
imap <A-k> <Up>
imap <A-h> <Left>
imap <A-l> <Right>

" use alt key to go to the end and front of the line
imap <A-6> <Esc>^i
imap <A-;> <Esc>;a

" use control l to correct the nearest spell mistake
imap <C-l> <Esc>[s1z=`]a

" force vim to access system clipboard
set clipboard=unnamed 

" set line number.
set number
:highlight LineNr ctermfg=grey

" set tab width as 4
set expandtab
set shiftwidth=4
set softtabstop=4

" set control key board short cut
:behave xterm

" open spell check
set spell

" map leader to comma
let mapleader=" "

" save when lost focus or switch tab
set autowrite
autocmd FocusLost * :wa

" show matching bracket
set showmatch       

