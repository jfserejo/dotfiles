" -------------------------------------------------------------------------------
" General
" -------------------------------------------------------------------------------

" Get out of Vi's compatible mode
  set nocompatible

" Turn off modeline
  set nomodeline

" Number of things to remember in history
  set history=1000

" Define what file format is to be used
  set fileformat=unix

" Autoread file when changed from outside
  set autoread

" Disable intro message when starting Vim
  set shortmess=I

" Define <Leader> to the comma key
  let mapleader=","

" Load color scheme
  let g:solarized_termcolors=16
  colorscheme solarized


" -------------------------------------------------------------------------------
" File type
" -------------------------------------------------------------------------------

" Sets the character encoding used inside Vim. It applies to text in
" the buffers, registers, Strings in expressions, text stored in the
" viminfo file, etc. It sets the kind of characters which Vim can work
" with. Encoding should come before spelllang to avoid loading the
" dictionary twice.
set encoding=utf-8

" Sets the character encoding for the file of this buffer.
" When 'fileencoding' is different from 'encoding', conversion will be
" done when reading and writing the file
set fileencoding=utf-8

" Disable file type detection
filetype off

" Enable file type specific indenting and plugins
filetype plugin indent on


" -------------------------------------------------------------------------------
" Autocommands
" -------------------------------------------------------------------------------

" Set syntax highlighting for specific file types
au BufRead,BufNewFile *.md set filetype=markdown

" Automatically wrap at 80 characters for certain file types
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.tex setlocal textwidth=80
au BufRead,BufNewFile *.text setlocal textwidth=80

" Set tabs and autoindent for PHP files
au FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent


" -------------------------------------------------------------------------------
" Formatting
" -------------------------------------------------------------------------------

" When off, a buffer is unloaded when it is abandoned. When on, a
" buffer becomes hidden when it is abandoned. If the buffer is still
" displayed in another window, it does not become hidden. This setting
" affects all buffers
set hidden

" Show the line and column number of the cursor position, separated by a
" comma. When there is room, the relative position of the displayed text
" in the file is shown on the far right
set ruler

" When set to "dark", Vim will try to use colors that look good on a
" dark background. When set to "light", Vim will try to use colors that
" look good on light background
if has('gui_running')
    set background=light
else
    set background=dark
endif

" Copy indent from current line when starting a new line (typing <CR>
" in Insert mode or when using the "o" or "0" command). If you do not
" type anything on the new line except <BS> or CTRL-D and then type
" <Esc>, CTRL-O or <CR>, the indent is deleted again. Moving the cursor
" to another line has the same effect
set autoindent

" This is a sequence of letters which describes how automatic
" formatting is to be done. When the 'paste' option is on,
" no formatting is done
"
" t	     Auto-wrap text using textwidth
" c	     Auto-wrap comments using textwidth, inserting the current comment
" 	     leader automatically.
" r	     Automatically insert the current comment leader after hitting
" 	     <Enter> in Insert mode.
" o	     Automatically insert the current comment leader after hitting 'o' or
" 	     'O' in Normal mode.
" q	     Allow formatting of comments with "gq".
" 	     Note that formatting will not change blank lines or lines containing
" 	     only the comment leader. A new paragraph starts after such a line,
" 	     or when the comment leader changes.
" w	     Trailing white space indicates a paragraph continues in the next line.
" 	     A line that ends in a non-white character ends a paragraph.
" a	     Automatic formatting of paragraphs. Every time text is inserted or
" 	     deleted the paragraph will be reformatted. See |auto-format|.
" 	     When the 'c' flag is present this only happens for recognized
" 	     comments.
" n	     When formatting text, recognize numbered lists. This actually uses
" 	     the 'formatlistpat' option, thus any kind of list can be used. The
" 	     indent of the text after the number is used for the next line. The
"     	 default is to find a number, optionally be followed by '.', ':', ')',
"     	 ']' or '}'. Note that 'autoindent' must be set too. Doesn't work
"     	 well together with "2".
"     	 Example: >
"      		    1. the first item
" 	     	       wraps
" 	     	    2. the second item
" 2	     When formatting text, use the indent of the second line of a paragraph
" 	     for the rest of the paragraph, instead of the indent of the first
" 	     line. This supports paragraphs in which the first line has a
" 	     different indent than the rest. Note that 'autoindent' must be set
" 	     too.
" 	     Example: >
" 		              first line of a paragraph
" 	     	    second line of the same paragraph
" 	     	    third line.
" v	     Vi-compatible auto-wrapping in insert mode: Only break a line at a
" 	     blank that you have entered during the current insert command. (Note:
" 	     this is not 100% Vi compatible. Vi has some "unexpected features" or
" 	     bugs in this area. It uses the screen column instead of the line
" 	     column.)
" b	     Like 'v', but only auto-wrap if you enter a blank at or before
" 	     the wrap margin. If the line was longer than 'textwidth' when you
" 	     started the insert, or you do not enter a blank in the insert before
" 	     reaching 'textwidth', Vim does not perform auto-wrapping.
" l	     Long lines are not broken in insert mode: When a line was longer than
" 	     'textwidth' when the insert command started, Vim does not
" 	     automatically format it.
" m	     Also break at a multi-byte character above 255. This is useful for
" 	     Asian text where every character is a word on its own.
" M	     When joining lines, don't insert a space before or after a multi-byte
" 	     character. Overrules the 'B' flag.
" B	     When joining lines, don't insert a space between two multi-byte
" 	     characters. Overruled by the 'M' flag.
" 1	     Don't break a line after a one-letter word. It's broken before it
" 	     instead (if possible).
set formatoptions=tcqr


" -------------------------------------------------------------------------------
" Editing
" -------------------------------------------------------------------------------

" When this option is set, the screen will not be redrawn while
" executing macros, registers and other commands that have not been
" typed. Also, updating the window title is postponed. To force an
" update use :redraw
set lazyredraw

" In Insert mode: Use the appropriate number of spaces to insert a
" <Tab>. Spaces are used in indents with the '>' and '<' commands and
" when 'autoindent' is on
set expandtab

" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'. 'tabstop' or 'softtabstop' is used in other places
set smarttab

" Number of spaces that a <Tab> counts for
set tabstop=2

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>. It "feels" like
" <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s
" is used. 'softtabstop' is set to 0 when the 'paste' option is set
set softtabstop=2

" Number of spaces to use for each step of (auto)indent
set shiftwidth=2

" Enable syntax highlighting
syntax on

" Show matching brackets
set showmatch

" Tenths of a second to show the matching parenthesis, when 'showmatch'
" is set. Note that this is not in milliseconds, like other options
" that set a time
set matchtime=5

" Toggle hidden characters display
map <silent> <F10> :set nolist!<CR>:set nolist?<CR>

" Treat <p> and <li> as block tags
let g:html_indent_tags = 'li\|p'


" -------------------------------------------------------------------------------
" Line wrap
" -------------------------------------------------------------------------------

" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
" mode. This is a list of items, separated by commas. Each item allows
" a way to backspace over something:
"
" value   effect
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"         sop once at the start of insert
"
" value   effect
"   0     same as ":set backspace=" (Vi compatible)
"   1     same as ":set backspace=indent,eol"
"   2     same as ":set backspace=indent,eol,start"
set backspace=2

" This option changes how text is displayed. It doesn't change the text
" in the buffer, see 'textwidth' for that. When on, lines longer than
" the width of the window will wrap and displaying continues on the
" next line. When off, lines will not wrap and only part of long
" lines will be displayed
set wrap

" Allow specified keys that move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in
" the line. Concatenate characters to allow this for these keys:
set whichwrap+=<,>,h,l

" Wrap lines at convenient points, ie. not in the middle of a word
set linebreak


" -------------------------------------------------------------------------------
" Search
" -------------------------------------------------------------------------------

" While typing a search command, show where the pattern, as it was
" typed so far, matches
set incsearch

" Ignore case in search phrase
set ignorecase

" Override the 'ignorecase' option if the search pattern contains
" upper case characters. Only used when the search pattern and
" 'ignorecase' option is on. Used for the commands "/", "?", "n",
" "N", ":g" and ":s". Not used for "*", "#", "gd", tag search,
" etc. After "*" and "#" you can make 'smartcase' used by doing a
" "/" command, recalling the search pattern from history and hitting
" <Enter>
set smartcase

" Changes the special characters that can be used in search patterns
set magic

" Highlight all matches in a search pattern
set hlsearch

" Mute highlighted search results
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


" -------------------------------------------------------------------------------
" Folding
" -------------------------------------------------------------------------------

" When off, all folds are open. This option can be used to quickly
" switch between showing all text unfolded an viewing the text with
" folds (including manually opened or closed folds). It can be toggled
" with the zi command. The 'foldcolumn' will remain blank when
" 'foldenable' is off
set foldenable

" The kind of folding used for the current window. Possible values:
" fold-manual   manual   Folds are created manually
" fold-indent   indent   Lines with equal indent form a fold
" fold-expr     expr     'foldexpr' gives the fold level of a line
" fold-marker   marker   Markers are used to specify folds
" fold-syntax   syntax   Syntax highlighting items specify folds
" fold-diff     diff     Fold text that is not changed
set foldmethod=marker


" -------------------------------------------------------------------------------
" Spell-checking
" -------------------------------------------------------------------------------

" A comma separated list of word list names. When the 'spell' option
" is on, spell-checking will be done for these languages.
set spelllang=en_us,nb

" Toggle spell-checking
map <silent> <F8> :set nospell!<CR>:set nospell?<CR>


" -------------------------------------------------------------------------------
" Menu completion
" -------------------------------------------------------------------------------

" Enable ctrl-n and ctrl-p to scroll through matches
set wildmenu

" Make commandline tab completion similar to bash
set wildmode=list:longest

" Stuff to ignore when tab completing
set wildignore=*~,*.aux,*.o,*.obj,*.pyc,*.toc


" -------------------------------------------------------------------------------
" Window layout
" -------------------------------------------------------------------------------

" Line numbers on
set number

" Toggle between relative and absolute numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunction

" Map toggling between relative and absolute numbers
nnoremap <Leader>r :call NumberToggle()<CR>

" Highlight the screen line of the cursor
set cursorline

" Hide the cursor line when in terminal
hi CursorLine term=none cterm=none

" Number of screen lines to use for the command-line
set cmdheight=1

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=7


" -------------------------------------------------------------------------------
" Multi-buffer/window/tab editing
" -------------------------------------------------------------------------------

" When off, a buffer is unloaded when it is abandoned. When on, a
" buffer becomes hidden when it is abandoned. If the buffer is still
" displayed in another window, it does not become hidden. This setting
" affects all buffers
set hidden

" When on, splitting a window will put the new wnidow right of the
" current one.  :vsplit
set splitright

" When on, splitting a window will put the new window below the
" current one.  :split
set splitbelow

" Searches the current directory as well as subdirectories
" with commands like :find, :grep, etc.
"set path=.,**

" Change directory to pwd of the buffer file
"autocmd BufEnter * cd %:p:h


" -------------------------------------------------------------------------------
" Status line
" -------------------------------------------------------------------------------

" The value of this option influences when the last window
" will have a status line.
" 0 = never
" 1 = only if there are at least two windows
" 2 = always
set laststatus=2

" Path to file in buffer
set statusline=%f\ 

" Help file flag
set statusline+=%h

" Filetype
set statusline+=%y

" Read only flag
set statusline+=%r

" Modified flag
set statusline+=%m

" Display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

" Display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" Fugitive statusline with current Git branch and the file's commit
set statusline+=%{fugitive#statusline()}

" Right part of the statusline
set statusline+=%-16(\ %l,%c-%v\ %)%P

" recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" return '[&et]' if &et is set wrong
" return '[mixed-indenting]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction


" -------------------------------------------------------------------------------
" Vundle
" -------------------------------------------------------------------------------

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" repos on github
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'mattn/zencoding-vim'
Bundle 'kana/vim-scratch'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'

" non github repos
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'


" -------------------------------------------------------------------------------
" Other extensions
" -------------------------------------------------------------------------------

" EasyMotion

    " Remap the default '<Leader> <Leader w'
    let g:EasyMotion_mapping_w = '<Space>'

    " Remap the default '<Leader> <Leader> b'
    let g:EasyMotion_mapping_b = '<C-@> <C-Space>'


" LaTeX-suite

    " LaTeX-suite grep will sometimes skip displaying the file name
    " if you search in a single file. This will confuse LaTeX-suite.
    " Set your grep program to always generate a filename.
    set grepprg=grep\ -nH\ $*

    " The file type of empty .tex files defaults to plain text
    " instead of TeX, which results in Vim-LaTeX not being loaded.
    " The following changes the default file type back to TeX
    let g:tex_flavor='latex'


" NERDTree

    nmap <silent> øt :NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\.pyc$','\.swp$','\.aux$','\.toc$']
