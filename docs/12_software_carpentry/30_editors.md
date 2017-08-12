# Editors {#editors}

Assigned: Andrea

## VIM

The editor to choose is VI, or more precisely, VIM (improved vi).

Install like this:

    $ sudo apt install vim

Documentation:

* [A VIM tutorial](http://www.openvim.com/)


Suggested `~/.vimrc`:

    syntax on
    set number
    filetype plugin indent on
    highlight Comment ctermfg=Gray
    autocmd FileType python set complete isk+=.,(


<!-- autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,( -->

### Visual mode

TODO: to write

### Indenting using VIM

Use the <kbd>&gt;</kbd> command to indent.

To indent 5 lines,  use
 <kbd>5</kbd>
 <kbd>&gt;</kbd>
 <kbd>&gt;</kbd>.

To mark a block of lines and indent it, use <kbd>V</kbd>.

For example, use <kbd>V</kbd><kbd>j</kbd><kbd>j</kbd><kbd>&gt;</kbd> to indent 3 lines.

Use <kbd>&lt;</kbd> to dedent.

To indent a curly-braces block, put your cursor on one of the curly braces and use >%.
