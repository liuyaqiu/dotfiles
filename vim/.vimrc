" This is the begin of vundle config!
set runtimepath+=~/.vim_runtime
" The Vundle plugin manager config.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
Bundle 'chriskempson/base16-vim'
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" This is the end of vundle config!

" Bundle Plugin "
Bundle 'Raimondi/delimitMate'
"
Bundle 'scrooloose/syntastic'
Bundle 'vim-airline/vim-airline-themes'
" Bundle 'altercation/vim-colors-solarized'

" This is the begin of amix-vim-config!  
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" This is the end of amix-vim-config!

set gfn=Source\ Code\ Pro\ Medium\ 14
set nu

"将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个vim的函数
" fun! ToggleFullscreen()
"    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
"endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

" Cpp (This is added for c++11 check)
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:ycm_show_diagnostics_ui = 1 " 启用了YCM，需要进行这一步的设置

" Config for YouCompleteMe
" 设置全局extra_conf文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python'
" 将上面的文件中的-Wc++98注释掉，就不会显示对C++98的警告
" 在接受补全后不分裂出一个窗口显示接受的项目
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Key Mapping
inoremap <C-k> <C-p>
inoremap <C-j> <C-n>

" set color scheme
syntax enable
let base16colorspace=256
set background=dark
colorscheme base16-solarized-dark

" 设置powerline
" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim

" 设置光标行高亮
set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" 设置光标列高亮
set cursorcolumn

let g:airline_powerline_fonts = 1
set cmdheight=1
set clipboard=unnamedplus

let g:NERDTreeWinPos = 'left'
" autocmd VimEnter * NERDTree

set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
