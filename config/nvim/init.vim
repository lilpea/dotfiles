if exists('+termguicolors')
"  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
autocmd BufEnter * silent! lcd %:p:h
set background=light
colorscheme NeoSolarized
let g:neosolarized_vertSplitBgTrans = 0