set nocompatible							"be iMproved, required
set hidden
set showtabline=0
set noswapfile
set nobackup

so ~/.vim/plugins.vim

syntax on
colorscheme onedark
set background=dark
set termguicolors

set t_CO=256								"Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira_Code:h13						"Set the default font family and size.
set linespace=9   						        "Macvim-specific line-height.
let NERDTreeDirArrows = 1
set noshowmode
set noshowcmd
set noruler

set updatetime=400

set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

set nowrap
set backspace=indent,eol,start

set autoindent
set copyindent

" If you want 4-space tabs:
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab


set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number								"Let's activate line numbers.


let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:php_var_selector_is_identifier = 1

"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.



"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>




"-------------Mappings--------------"

" Ctrl-P Style Fuzzy Search but with ctrl-space.
nnoremap <silent><C-p> :CtrlSpace O<CR>

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>
nmap <Leader>es :e ~/.vim/snippets/php.snippets<cr>

" Delete the current buffer.
nmap <Leader>q :bd<cr>

" Save file shortcuts
nmap <Leader>s :w

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <leader>n :NERDTreeToggle<cr>

inoremap jj <Esc>

noremap H ^
noremap L $
vnoremap L g_

nmap <leader>a :bnext<CR>
nmap <leader>z :bprevious<CR>

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

set display+=lastline

let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

"-------------Auto-Commands--------------"

autocmd BufWritePost *.php silent call PhpCsFixerFixFile()

"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

