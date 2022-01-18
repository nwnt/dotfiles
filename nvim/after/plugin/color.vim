" Color stuff {{{
let g:tokyonight_style = "storm"
let g:tokyonight_italic_fucntions = 1
let g:tokyonight_italic_variables = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the hint color to the orange color, and make the error color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

let g:tokyodark_transparent_background = 0
let g:tokyodark_color_gamma = "1.5"

highlight Normal guibg=none
colorscheme kanagawa
" }}}
" vim:foldmethod=marker:foldlevel=0
