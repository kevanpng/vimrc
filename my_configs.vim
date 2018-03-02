let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set timeoutlen=1000 ttimeoutlen=0
set splitright
let g:NERDTreeWinPos = "left"

python << EOF
import vim
import re

pudb_breakpoint = 'import pudb; pudb.set_trace()'

pudb_breakpoint = 'import pudb; pudb.set_trace()'
def set_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1

    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)

    vim.current.buffer.append(white_spaces + pudb_breakpoint, breakpoint_line)

vim.command('map <f9> :py set_breakpoint()<cr>')

def remove_breakpoints():
    op = 'g/^.*%s.*/d' % pudb_breakpoint
    vim.command(op)

vim.command('map <f12> :py remove_breakpoints()<cr>')
EOF

" for colour line at 80
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=0
endif

nnoremap <leader>a :Ack

nnoremap <leader>w <C-w>v<C-w>l

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

autocmd VimEnter * LiveReloadAll


noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>

" let g:indentLine_setColors = 0
let g:indentLine_char = '|'

nnoremap <leader><F7> :Ack 'ipdb'<CR>
nnoremap <leader><F8> :Ack 'pudb'<CR>

