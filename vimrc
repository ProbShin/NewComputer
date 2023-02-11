" This .vimrc file should be placed in your home directory
" The Terminal app supports (at least) 16 colors
" So you can have the eight dark colors and the eight light colors
" the plain colors, using these settings, are the same as the light ones
" NOTE: You will need to replace ^[ with a raw Escape character, which you
" can type by typing Ctrl-V and then (after releaseing Ctrl-V) the Escape key.

if has("terminfo")
	set t_Co=16
	set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
	set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
	set t_Co=16
	set t_Sf=[3%dm
	set t_Sb=[4%dm
endif

syntax on

" Everything from here on down is optional
" These colors are examples of what is possible
" type :help syntax
" or :help color within vim for more info
" and try opening the file
" share/vim/vim61/syntax/colortest.vim
" Note: where share is depends on where/how you installed vim

highlight Comment       ctermfg=DarkGreen
highlight Constant      ctermfg=DarkMagenta
highlight Character     ctermfg=DarkRed
highlight Special       ctermfg=DarkBlue
highlight Identifier    ctermfg=DarkCyan
highlight Statement     ctermfg=DarkBlue
highlight PreProc       ctermfg=DarkBlue
highlight Type          ctermfg=DarkBlue
highlight Number        ctermfg=DarkBlue
highlight Delimiter     ctermfg=DarkBlue
highlight Error         ctermfg=Black
highlight Todo          ctermfg=DarkBlue
highlight WarningMsg    term=NONE           ctermfg=Black ctermbg=NONE   
highlight ErrorMsg      term=NONE           ctermfg=DarkRed ctermbg=NONE 

" These settings only affect the X11 GUI version (which is different
" than the fully Carbonized version at homepage.mac.com/fisherbb/

highlight Comment       guifg=Green                 gui=NONE
highlight Constant      guifg=Magenta               gui=NONE
highlight Character     guifg=Red                   gui=NONE
highlight Special       guifg=Blue                  gui=NONE
highlight Identifier    guifg=DarkCyan              gui=NONE
highlight Statement     guifg=DarkGreen             gui=NONE
highlight PreProc       guifg=Purple                gui=NONE
highlight Type          guifg=DarkGreen             gui=NONE
"highlight Normal                   guibg=#E0F2FF   gui=NONE
highlight Number        guifg=Blue                  gui=NONE
"highlight Cursor       guifg=NONE  guibg=Green
"highlight Cursor       guifg=bg    guibg=fg
highlight Delimiter     guifg=blue                  gui=NONE
"highlight NonText                  guibg=lightgray gui=NONE
"highlight Error        guifg=White guibg=Red       gui=NONE
highlight Error         guifg=NONE  guibg=NONE      gui=NONE
highlight Todo          guifg=Blue  guibg=Yellow    gui=NONE

"#### end color settings #############  


"winpos 5 5	                             " 设定窗口位置  
"set lines=40 columns=155                " 设定窗口大小  
set go=                                  " 不要图形按钮  
"color asmanian2                         " 设置背景主题  
"colorscheme murphy                      " 设置配色方案
"colorscheme elflord
"set background=dark                     " 背景使用黑色 

"set guifont=Courier_New:h10:cANSI       " 设置字体  
autocmd InsertLeave * se nocul           " 用浅色高亮当前行  
autocmd InsertEnter * se cul             " 用浅色高亮当前行  
set showcmd                              " 输入的命令显示出来，看的清楚些
set novisualbell                         " 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [R,C=%l,%c][%p%%][LEN=%L]\ %=[%{&ff}]%y[%{&encoding}]\    "状态行显示的内容  
set laststatus=2                         " 启动显示状态行(1),总是显示状态行(2)  

set nocompatible                         " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

" 显示中文帮助
"if version >= 603
"    set helplang=cn
"    set encoding=utf-8
"endif


"编码设置
"set enc=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置
"set langmenu=zh_CN.UTF-8
"set helplang=cn

"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936
"set fileencoding=utf-8

" file extention
autocmd BufEnter *.tpp :setlocal filetype=cpp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: xc") 
		call append(line(".")+2, "\# Descriptions: ") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."),   "    > File Name: ".expand("%")) 
		call append(line(".")+1, "    > Author: xc") 
		call append(line(".")+2, "    > Descriptions: ") 
		call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif

	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif

	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif

	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G

endfunc 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY

" 缩进 F12
map <F12> gg=G 

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

"去空行  F2
nnoremap <F2> :g/^\s*$/d<CR> 

"比较文件 Ctr+F2
nnoremap <C-F2> :vert diffsplit 

"新建标签  
map <M-F2> :tabnew<CR>  

"列出当前目录文件 F3 
map <F3> :tabnew .<CR>  

"打开树状文件目录  
map <C-F3> \be  

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()

	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"

	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"

	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"

	elseif &filetype == 'sh'
		:!./%

	endif

endfunc

"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"

endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置当文件被改动时自动载入
set autoread

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全 
set completeopt=preview,menu 

"允许插件  
filetype plugin on

"共享剪贴板  
set clipboard+=unnamed 

""从不备份  
"set nobackup

"make 运行
:set makeprg=g++\ -Wall\ \ %

"自动保存
set autowrite

set ruler                   " 打开状态栏标尺

set cursorline              " 突出显示当前行

set magic                   " 设置魔术

set guioptions-=T           " 隐藏工具栏

set guioptions-=m           " 隐藏菜单栏
":

set foldcolumn=0
set foldmethod=indent       " 折叠方式 缩进，手动
set foldmethod=manual      " 手动折叠  
set foldlevel=3 
set foldenable              " 允许折叠

set noeb                    " 去掉输入错误的提示声音
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
set autoindent              " 自动缩进
set cindent                 " 自动缩进
set tabstop=8               " Tab键的宽度
set softtabstop=4           " 统一缩进为4
set shiftwidth=4           " 统一缩进为4
set expandtab
"set noexpandtab             " 不要用空格代替制表符
set smarttab                " 在行和段开始处使用制表符
set number                  " 显示行号
set history=1000            " 历史记录数
set nobackup                " 禁止生成临时文件
set noswapfile              " 禁止生成临时文件
set ignorecase              " 搜索忽略大小写
set hlsearch                " 搜索逐字符高亮
set incsearch               " 搜索逐字符高亮
set gdefault                " 行内替换
set cmdheight=1             " 命令行（在状态行下）的高度，默认为1，这里是2
filetype on                 " 侦测文件类型
filetype plugin on          " 载入文件类型插件
filetype indent on          " 为特定文件类型载入相关缩进文件
set viminfo+=!              " 保存全局变量
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set linespace=0             " 字符间插入的像素行数目
set wildmenu                " 增强模式中的命令行自动完成操作
set backspace=2             " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l      " 允许backspace和光标键跨越行边界
"set mouse=a                 " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）

set selection=exclusive
set selectmode=mouse,key

set report=0                " 通过使用: commands命令，告诉我们文件的哪一行被改变过

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 为C程序提供自动缩进
set smartindent

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

"自动补全
"":inoremap ( ()<ESC>i

":inoremap ) <c-r>=ClosePair(')')<CR>

"":inoremap { {<CR>}<ESC>O

":inoremap } <c-r>=ClosePair('}')<CR>

"":inoremap [ []<ESC>i

":inoremap ] <c-r>=ClosePair(']')<CR>

"":inoremap " ""<ESC>i

"":inoremap ' ''<ESC>i

function! ClosePair(char)

	if getline('.')[col('.') - 1] == a:char

		return "\<Right>"

	else

		return a:char

	endif

endfunction

filetype plugin indent on 

"打开文件类型检测, 加了这句才可以用智能补全

set completeopt=longest,menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment the following to have Vim jump to the last position when
" " reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Tlist_Sort_Type = "name"    " 按照名称排序  

let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  

let Tlist_Compart_Format = 1    " 压缩方式  

let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  

let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  

let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  

autocmd FileType java set tags+=D:\tools\java\tags  

"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  

"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的

"设置tags  

set tags=tags  

"set autochdir 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"其他东东
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"默认打开Taglist 

let Tlist_Auto_Open=1 

"""""""""""""""""""""""""""""" 

" Tag list (ctags) 

"""""""""""""""""""""""""""""""" 

let Tlist_Ctags_Cmd = '/usr/bin/ctags' 

let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 

let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 

let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口

" minibufexpl插件的一般设置

let g:miniBufExplMapWindowNavVim = 1

let g:miniBufExplMapWindowNavArrows = 1

let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


