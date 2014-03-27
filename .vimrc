" ############### Vundle ############### 
" Install Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Repo List
Bundle 'gmarik/vundle'
Bundle 'perl-support.vim'
Bundle 'jslint.vim'
Bundle 'taglist-plus'
Bundle 'git://github.com/tpope/vim-sensible.git'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'

filetype plugin indent on     " required!
" ####################################### 


" C-c and C-v - Copy/Paste в \"глобальный клипборд\"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi





" ############### Mouse #################
" Поддержка мыши
"set mouse=a
"set mousemodel=popup

" Скрывать указатель мыши, когда печатаем
set mousehide
" ####################################### 








" ############# Табуляция ###############
" make backspace work like most other apps
"set backspace=2

" если не работает backspace
set backspace=indent,eol,start

" Включаем умные отспупы (например, автоотступ после {)
set smartindent

" размер табов
set ts=4
set sw=4

" вставлять пробелы, а не табы
set expandtab

" величина отступа
set softtabstop=4

" Fix <Enter> for comment
set fo+=cr

" не разрывать строку
"set nowrap

" прокрутка вправо/влево когда строка заежает за край и вы по ней ползаете
"set sidescroll=5

" установить автоотступ
set autoindent

" Автодополнение <Tab>-ом
imap <S-Tab> <C-N>

" 'умный' Home
nmap <Home> ^
imap <Home> <Esc>I

" вкл/выкл отображения номеров строк
imap <F1> <Esc>:set<Space>nu!<CR>a
nmap <F1> :set<Space>nu!<CR>
" #######################################















" ############## Кодировка ###############
" Кодировка терминала, должна совпадать с той, которая используется для вывода в терминал
set termencoding=utf-8

" возможные кодировки файлов и последовательность определения.
set fileencodings=utf8,cp1251,koi8-r

set encoding=utf8

" Меню кодировок F8
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=8bit-koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=8bit-cp1251<CR>
menu Encoding.ibm-866 :e ++enc=8bit-ibm866<CR>
menu Encoding.utf-8 :e ++enc=2byte-utf-8 <CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
map <F8> :emenu Encoding.<TAB>

" Конвертирование текста Shift+F8
set  wildmenu
set  wcm=<Tab>
menu FEnc.cp1251    :set fenc=cp1251<CR>
menu FEnc.koi8-r    :set fenc=koi8-r<CR>
menu FEnc.cp866     :set fenc=ibm866<CR>
menu FEnc.utf-8     :set fenc=utf-8<CR>
menu FEnc.ucs-2le   :set fenc=ucs-2le<CR>
map  <S-F8> :emenu FEnc.<TAB>
" #########################################











" ################## ПОИСК ######################
" игнорировать прописные/строчные при поиске
set ignorecase

" при поиске помечать все найденные строки
set hlsearch

" при поиске перескакивать на найденный текст в процессе набора строки
set incsearch
" ###############################################









" ################### ТЕМА ######################
" насильно заставить его считать, что терминал с темным фоном
set background=dark

" цвет комментариев
highlight Comment ctermfg=darkgreen

" включить подсветку синтаксиса
syntax on

"let g:Powerline_theme = 'solarized256'
" ###############################################


" возможность использовать команды при русской раскладке (в некоторых случаях
" не работает или может создавать проблемы)
" set langmap=Ж:,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,б\,,ю.,ё`








" Выход без сохранения по кнопке F10
nmap <F10> :qa!<CR>




" увеличение истории команд
set history=500



" отключает\включает автоотступ для вставки текста


set pastetoggle=<F2>


" Удаление пустых отквоченных строк при ответе из mutt'a
au BufReadPost /tmp/mutt-* sil %s/^\(>\s*\)\+$//e


" Indent line(s)
vmap <TAB> :s/^/    /<cr>
map <TAB> :s/^/    /<cr>

" Unindent line(s)
vmap <S-TAB> :s/^    //<cr>
map <S-TAB> :s/^    //<cr>


" Advanced comments
" csym here is variable which contains comment symbol, like `#' or `"'
" Comment line(s)
fun! VisComment(c)
    exe "s/^/".a:c." /"
endfunction


fun! VisUncomment(c)
    exe "s/^".a:c." //"
endfunction


map <S-c> :exe "s/^/".csym." /"<cr>
vmap <S-c> :call VisComment(csym)<cr>

" Uncomment line(s)
map <S-u> :exe "s/^".csym." //"<CR>
vmap <S-u> :call VisUncomment(csym)<cr>


" Set `csym' according to file type
au! BufNewFile,BufRead * let csym="#"
au! BufNewFile,BufRead *.java let csym="//"
au! BufNewFile,BufRead *.pp let csym="//"
au! BufNewFile,BufRead *.cpp let csym="//"
au! BufNewFile,BufRead *.c let csym="//"
au! BufNewFile,BufRead *.vim let csym="\""
au! BufNewFile,BufRead .vimrc let csym="\""


" Удобный переход по окнам:
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Проверка орфографии
" переключение языков <F12>
" меню с альтернативными вариантами
" 
if version >= 700
    setlocal spell spelllang=
    setlocal nospell
    function ChangeSpellLang()
        if &spelllang =~ "ru"
            setlocal spell spelllang=en_us
            echo "spelllang: en"
        elseif &spelllang =~ "en"
            setlocal spell spelllang=
            setlocal nospell
            echo "spelllang: off"
        else
            setlocal spell spelllang=ru_yo
            echo "spelllang: ru"
        endif
    endfunc
    map <F12> <Esc>:call ChangeSpellLang()<CR>
endif 

" новый таб
"map <C-t> <Esc>:tabnew 


map <F5> :TlistToggle<CR>

" удалить пустые строки, в вделенном блоке, по Ctrl+A
map <C-a> <Esc>:'<,'>!sed "/^> $/d;/^$/d"<CR>

" позволяет видить табы и пробелы в конце строки
" map <F3> <Esc>:set list<CR>:set listchars=tab:>-,trail:-<CR>

" Включает/выыключает подсветку всего найденного
map <F3> <Esc>:set hls!<CR>
map <S-C-p> :set filetype=perl<CR>


set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" imap :!setxkbmap us:!setxkbmap us,ru
" nmap :!setxkbmap us:!setxkbmap us,ru

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов 
set complete+=t

filetype plugin on
" filetype on



" HEX Mode
nnoremap <F4> :Hexmode<CR>
" inoremap <C-> <Esc>:Hexmode<CR>
" vnoremap <C-> :<C-u>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!

    " set binary option for all binary files before reading them
    au BufReadPre *.bin,*.hex setlocal binary

    " if on a fresh read the buffer variable is already set, it's wrong
    au BufReadPost *
          \ if exists('b:editHex') && b:editHex |
          \   let b:editHex = 0 |
          \ endif

    " convert to hex on startup for binary files automatically
    au BufReadPost *
          \ if &binary | Hexmode | endif

    " When the text is freed, the next time the buffer is made active it will
    " re-read the text and thus not match the correct mode, we will need to
    " convert it again if the buffer is again loaded.
    au BufUnload *
          \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
          \   call setbufvar(expand("<afile>"), 'editHex', 0) |
          \ endif

    " before writing a file when editing in hex mode, convert back to non-hex
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif

    " after writing a binary file, if we're in hex mode, restore hex mode
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif

" Строка статуса
" 
" %f - имя файла и путь к нему, относительно текущего каталога
" %m - флаг модификации/изменения, выводит [+] если буфер изменялся
" %r - флаг "только для чтения", выводит [RO] если буфер только для чтения
" %h - флаг буфера помощи, выводит [help] если буфер со справкой vim
" %w - флаг окна превью, выводит [Preview]
" '\ ' - экранированный символ пробела. Пробел можно указывать только экранированным, иначе ошибка синтаксиса
" %y - тип файла в буфере, например [vim]
" enc:%{&enc} - отображение кодировки encoding (enc). Обратите внимание: "enc:" - текст, "%{&enc}" - вывод значения внутренней переменной (enc)
" ff:%{&ff} - отображение формата перевода строки fileformat (ff)
" fenc:%{&fenc} - отображение кодировки сохранения в файл fileencoding (fenc)
" %= - далее выравнивать вправо
" ch:%3b - код символа под курсором в десятичной чистеме счисления, минимум 3 символа
" hex:%2B - код символа под курсором в шестнадцатеричной системе счисления, минимум 2 символа
" col:%2c - курсор в колонке, минимум 2 символа
" line:%2l/%L - курсор в строке (минимум 2 символа)/всего строк в файле
" %2p - число % в строках, где находится курсор (0% - начало файла; 100% - конец файла), минимум 2 символа
" %% - т.к. символ '%' используется для переменных, то вывод символа '%' в строке статуса нужно делать особым образом - %%
" set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
" set rulerformat=%15(%c%V\ %p%%%)
"set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
" function! FileTime()
"   let ext=tolower(expand("%:e"))
"   let fname=tolower(expand('%<'))
"   let filename=fname . '.' . ext
"   let msg=""
"   let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%)",getftime(filename))
"     return msg
"     endfunction
" 
"     function! CurTime()
"       let ftime=""
"         let ftime=ftime." ".strftime("%b,%d %y %H:%M:%")
"   return ftime
" endfunction

" au! BufNewFile,BufRead *.cgi,*.pl inoremap { {<CR>}<Esc>O


" чтение документов Ms-Word, нужен antiword

:autocmd BufReadPre *.doc set ro
:autocmd BufReadPre *.doc set hlsearch!
:autocmd BufReadPost *.doc %!antiword "%"

" if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif

" for Dancer tamplates
au! BufNewFile,BufRead *.tt set filetype=html


" set up syntax highlighting for my e-mail  
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail

" командный режим в русской раскладке
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

" позволяет по нажатию клавиши ; сконструировать
" запрос на замену слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost * if &bin | %!xxd
    au BufReadPost * set ft=xxd | endif
    au BufWritePre * if &bin | %!xxd -r
    au BufWritePre * endif
    au BufWritePost * if &bin | %!xxd
    au BufWritePost * set nomod | endif
augroup END
