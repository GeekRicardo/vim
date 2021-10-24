" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
    syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" 添加anaconda3的python动态链接库
set pythonthreedll=/usr/local/anaconda3/lib/libpython3.7m.dylib
set pythonthreehome=/usr/local/anaconda3


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set ignorecase     " Do case insensitive matching
"set smartcase      " Do smart case matching
"set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif


"start-自己添加的配置
"set editing-mode vi     "shell开启编辑模式
set nu "显示行号
"colorscheme asmanian2 "配色方案
"set nobackup  覆盖文件时不备份
set cursorline "突显显示当前行
set ruler "在右下角显示光标的状态行
set autoindent "自动缩进
set cursorline "下划线显示当行
set ic "查找时不考虑大小写
"set noic "查找时考虑大小写
set hlsearch "查找时高亮显示查找结果
set mouse=a "可以使用鼠标
set tabstop=4 "设置tab长度为4，默认为8，ts
set shiftwidth=4 "设定>命令移动时宽度为4，sw
set expandtab "编辑时将所有 Tab 替换为空格，et
"注：该选项只在编辑时将 Tab 替换为空格， 如果打开一个已经存在的文件， 并不会将已有的 Tab 替换为空格。 如果希望进行这样的替换的话， 可以使用这条命令“:retab”。
set softtabstop=4 "使得按退格键时可以一次删除4个空格
"set formatoptions=tcqro "使得注释换行时自动加上前面的的 // 注释符
"--------------------- 个人 配置 ------------------
"设置命令行和状态栏
set cmdheight=1 "设定命令行的行数为1
set laststatus=2 "显示状态栏(默认值为1，无法显示状态栏，为2时显示状态栏)
set ruler "标尺信息，显示当前光标的坐标，这一步 需要设置 ”显示状态栏“，才能看到效果

"set statusline=%F%m%r\ ASCII=\%b,HEX=\%B,%l,%c%V\ %L-%p%%
"设置在状态行显示的信息如下：
"   %F              当前文件名
"   %m              当前文件修改状态
"   %r              当前文件是否只读
"   %Y              当前文件类型
"   %{&fileformat}  当前文件编码
"   %b              当前光标处字符的ASCII码值
"   %B              当前光标处字符的十六进制值
"   %l              当前光标行号
"   %c              当前光标列号
"   %V              当前光标虚拟列号(根据字符所占字节数计算)
"   %p              当前行占总行数的百分比
"   %%              百分号
"   %L              当前文件总行数

"au BufNewFil"e,BufRead *.py
            "\set tabstop=4
            "\set softtabstop=4
            "\set shiftwidth=4
            "\set textwidth=79

"获取当前文件名
function GetFileName()
    return bufname(winbufnr(winnr()))  "获取当前窗口缓冲区的名字
endfunction

"获取当前时间，精确到分
function GetDateTime()
    return strftime("%Y-%m-%d %H:%M")
endfunction

"end--自己添加的配置"




"----------------插件配置-------------------
set nocompatible "be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/syntastic' " 语法检测工具
Plugin 'scrooloose/nerdcommenter' "注释代码工具 \cc注释当前行 \cu 撤销注释当前行 \cs sexily注释 \cA 行尾注释，切换成输入模式
Plugin 'scrooloose/nerdtree' "树状结构文件夹目录
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs' " 括号自动匹配

Plugin 'junegunn/seoul256.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"powerline部分"
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set guifont=Sauce\ Code\ Powerline:h14.5
set laststatus=2
set encoding=utf-8
set t_Co=256
set number
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set background=dark

set modelines=0

set backspace=2 "设置更好的删除"

syntax on "自动语法高亮"

"用浅色高亮当前行"
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

set smartindent "智能对齐"

set autoindent "自动对齐"

set confirm "在处理未保存或只读文件的时候，弹出确认框"

set tabstop=4 "tab键的宽度"
set softtabstop=4 "使得按退格键可以一次删掉4个空格"
set shiftwidth=4 "统一缩进为4"
set expandtab "不要用空格替代制表符"

set autochdir "自动切换当前目录位当前文件所在目录"

set number "显示行号"
set history=50  "历史纪录数"
set hlsearch "搜索时高亮被查找到的文本"
set incsearch "搜素高亮,搜索逐渐高亮"

set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

set gdefault "行内替换“
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1 "编码设置”

set guifont=Menlo:h16:cANSI "设置字体“
set langmenu=zn_CN.UTF-8
set helplang=cn  "语言设置”

set ruler "在编辑过程中，在右下角显示光标位置的状态行“

set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{kite#statusline()}\ %{&fileformat}\ {&encoding}\ %c:%l/%L%)\
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\  %{&fileformat}\ {&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息

set showcmd "在状态行显示目前所执行的命令，未完成的指令片段也会显示出来"


set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行的距离"
set showmatch "高亮显示对应的括号"
set matchtime=5 "对应括号高亮时间(单位是十分之一秒)"

set autowrite "在切换buffer时自动保存当前文件"

set wildmenu  "增强模式中的命令行自动完成操作"

set linespace=2 "字符间插入的像素行数目"
set whichwrap=b,s,<,>,[,] "开启normal 或visual模式下的backspace键空格键，左右方向键,insert或replace模式下的左方向键，右方向键的跳行功能"

filetype plugin indent on "分为三部分命令:file on,file plugin on,file indent on 分别是自动识别文件类型, 用用文件类型脚本,使用缩进定义文件"

set foldenable  "允许折叠"
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为
" set foldclose=all " 设置为自动关闭折叠
" " nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" " 用空格键来开关折叠

set cursorline "突出显示当前行"
set magic  "设置魔术？神马东东"
set ignorecase "搜索忽略大小写"
filetype on "打开文件类型检测功能"
set background=dark
set t_Co=256   "256色"
set mouse=a  "允许鼠标"

" 配置nerdtree
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签

" 配置nerdtree的快捷键
let mapleader = ","
map <leader>ne :NERDTreeToggle<CR>
map <leader>tl :TlistToggle<cr>
nnoremap <leader>ma :set mouse=a<cr>
nnoremap <leader>mu :set mouse=<cr>


"一键运行python
Plugin 'skywind3000/asyncrun.vim'
nnoremap <F5> :call CompileRunGcc()<cr>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'python'
        if search("@profile")
            exec "AsyncRun kernprof -l -v %"
            exec "copen"
            exec "wincmd p"
        elseif search("set_trace()")
            exec "!python3 %"
        else
            exec "AsyncRun -raw python3 %"
            exec "copen"
            exec "wincmd p"
        endif
    endif

endfunc


"系统剪切板
set clipboard=unnamed
"代码折叠
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

"屏幕分割
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

Plugin 'gmarik/Vundle.vim'
"自动缩进
Plugin 'vim-scripts/indentpython.vim'
"检查语法/高亮
"Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"状态栏
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
let g:Powerline_symbols = 'fancy'
set laststatus=2
"函数参数自动补全
Plugin 'tenfyzhong/CompleteParameter.vim'
"------------------------------------------------------------------------------------
"对齐线插件
" 修改主题,不然会报错 highlight group not found
colorscheme default 
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1 ""添加行，vim启动时启用
let g:indent_guides_start_level = 1           ""添加行，开始显示对齐线的缩进级别
let g:indent_guides_guide_size = 1            ""添加行，对齐线的宽度，（1字符）
let g:indent_guides_tab_guides = 0            ""添加行，对tab对齐的禁用

"格式化代码插件
"Plugin 'Chiel92/vim-autoformat'
"F3自动格式化代码
"noremap <F3> :Autoformat<CR>
"let g:autoformat_verbosemode=1
"保存时自动格式化代码，针对所有支持的文件
"au BufWrite * :Autoformat




"自动补全
Bundle 'Valloric/YouCompleteMe'
" 自动补全配置
set completeopt=menuone,noinsert    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> "跳转到定义处
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_WinWidth=40
let Tlist_Aotu_Open = 1
let Tlist_exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
noremap <F6> :!ctags -R<CR>


" tagbar插件
nmap <leader>tb :TagbarToggle<CR>
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F3> :Tagbar<CR>
"autocmd BufReadPost *.py,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启




"YCM Still no compile flags, no completions yet.解决
let g:ycm_global_ycm_extra_conf = 'path to .ycm_extra_conf.py'

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'go'
        exec '!go run %'
    endif
endfunc


" F5编译和运行C程序，C++程序,Python程序，shell程序，F9 gdb调试
" 请注意，下述代码在windows下使用会报错，需要去掉./这两个字符

" <f5> 编译和运行C
map <f5> :call CompileRunGcc()<cr>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc

"< F5> 编译和运行C++
map <f5> :call CompileRunGpp()<cr>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc

" <f5> 运行python程序
map <f5> :w<cr>:!python %<cr>

" <f5> 运行shell程序
map <f5> :call CompileRunSH()<cr>
func! CompileRunSH()
exec "w"
exec "!chmod a+x %"
exec "!./%"
endfunc

"<f9>  gdb调试
map <f9> :call Debug()<cr>
func!  Debug()
exec "w"
exec "!gcc % -o %< -gstabs+"
exec "!gdb %<"
endfunc

"call plug#begin('~/.vim/plugged')

"call plug#end()
colo seoul256
set background=dark

"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
"set statusline=%<%f\ %h%m%r=%-14.(%l,%c%V%)\ %P
set laststatus=2

"取消响铃
set visualbell
set t_vb=

Plugin 'fatih/vim-go'
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

let g:go_gopls_enabled = 0
