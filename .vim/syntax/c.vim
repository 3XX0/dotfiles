let c_hi_identifiers = 'functions'
exec 'runtime! syntax/glibc.vim'

syn match cFunction '\w*\s*\ze(' contains=cLibFunction
hi cLibFunction ctermfg=125 "rgb=175,0,95"
