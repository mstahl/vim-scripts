""" Vundle stuff

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'Shougo/neocomplcache'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'danchoi/ruby_bashrockets.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'ingydotnet/yaml-vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'mxw/vim-jsx'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'othree/eregex.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/openscad.vim'

call vundle#end()

" Stuff for vim-textobj-rubyblock
runtime macros/matchit.vim
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif

filetype plugin indent on

""" My settings

" UTF-8 All the way
scriptencoding utf-8

" Use zsh.
set shell=zsh

set nocompatible
syntax on

" Set to auto read when a file is changed from the outside
set autoread

""" COLOR SUPPORT

" Explicitly set 256 color support
" set t_Co=256

if has("gui_running")
  colorscheme solarized
  call togglebg#map("<F5>")
else
  colorscheme twilight
endif
set background=light

""" TEXT SETTINGS

" Disable line wrapping
set nowrap

" use indents of 2 spaces, and have them copied down lines:
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" line numbers
set number
set numberwidth=3

""" KEY BINDINGS

let mapleader = ","

""" WINDOW SPLITTING

" Open new horizontal split windows below current
set splitbelow

" Open new vertical split windows to the right
set splitright

" Set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

" Use the tab complete menu
set wildmenu

""" KEYBINDINGS

" Quick, jump out of insert mode while no one is looking
" imap ii <Esc>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

""" CUSTOM PLUGINS

" FuzzyFinder Path Splitting (ala textmate)
let g:fuf_splitPathMatching = 1

" Write stats to file
let g:fuf_infoFile = '~/.vim-fuf'
let g:fuf_learningLimit = 500

""" CUSTOM FUNCTIONS

" Add RebuildTagsFile function/command
function! s:RebuildTagsFile()
  !ctags -R --exclude=coverage --exclude=files --exclude=public --exclude=log --exclude=tmp --exclude=vendor *
endfunction
command! -nargs=0 RebuildTagsFile call s:RebuildTagsFile()

""" STATUS BAR CONFIG

set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

""" Search Config

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" <leader>f to startup an ack search
map <leader>f :Ack<Space>


" RUBY

" Highlight ruby operators
let ruby_operators = 1

" Turn off rails bits of statusbar
let g:rails_statusline=0

" NERDCommenter
let NERDDefaultNesting = 0
let NERDRemoveExtraSpaces = 1
let NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
  \'haskell': {'left': '--', 'leftAlt': '{-', 'rightAlt': '-}'},
  \'spice': {'left': '*'}
\}

" AUTOCOMMANDS

function! CustomClojureSettings()
  set filetype=clojure
endfunction

" function! CustomJsonSettings()
  " autocmd BufRead *.json set filetype=json
  " au! Syntax json source ~/Downloads/json.vim
  " autocmd FileType json set equalprg=json_reformat
  " autocmd FileType json set makeprg=jsonval\ %
  " autocmd FileType json set errorformat=%E%f:\ %m\ at\ line\ %l,%-G%.%#
" endfunction

function! CustomMarkdownSettings()
  set filetype=mkd
endfunction

augroup SpicyAutoCommands
  autocmd BufEnter,BufWritePost *.clj   call CustomClojureSettings()
  autocmd BufEnter *.markdown call CustomMarkdownSettings()
  " autocmd BufRead *.json call CustomJsonSettings()
  " autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  " autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
augroup END

" Don't show invisibles"
set nolist

" Default to case-insensitive search
set smartcase

" Allow backspacing over EOL and start of insert
set backspace=eol,start,indent

" My extra special key macros ================================================

function! Headerify()
  call s:CommentLinesMinimal(line("."))
endfunction

" Remove trailing whitespace
vmap ,ww :s/\s*$//<CR>
" Set spellchecking for markdown files
autocmd FileType markdown setlocal spell spelllang=en_us

" MOAR AUTOCOMMANDS

autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab
autocmd FileType text setlocal wrap linebreak nolist
autocmd FileType markdown setlocal wrap linebreak nolist

function! RubyInfo()
  ruby << EOF
    puts RUBY_VERSION
    puts RUBY_PLATFORM
    puts RUBY_RELEASE_DATE
EOF
endfunction

" rubyfile $HOME/.vim/vim.rb

nmap q <ESC>
vmap q <ESC>

" Keyboard mappings for Ruby hash conversion
vmap ,ch :Bashrocket<CR>
nmap ,ch :Bashrocket<CR>

" Powerline support
if filereadable("/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
  source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
  set laststatus=2
endif

" Golang support
let g:go_fmt_autosave = 0

" Spellcheck magic (regenerates spellcheck files on-the-fly)
for d in glob('~/.vim/spell/*.add', 1, 1)
  if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
    exec 'mkspell! ' . fnameescape(d)
  endif
endfor

" Make 1 space instead of 2 after periods while wrapping lines
set nojoinspaces
