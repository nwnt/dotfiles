" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#83a598'

"Goyo integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
