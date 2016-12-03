set noexpandtab
set list listchars=tab:\ \ ,

autocmd BufWritePre *.go call go#fmt#Format(-1)

command! -nargs=0 Fmt call go#fmt#Format(-1)
command! -nargs=0 Imports call go#fmt#Format(1)

command! -nargs=? Drop call go#import#SwitchImport(0, '', <f-args>)
command! -nargs=1 Import call go#import#SwitchImport(1, '', <f-args>)
command! -nargs=* ImportAs call go#import#SwitchImport(1, <f-args>)

function! s:GoVet()
    cexpr system("go vet " . shellescape(expand('%')))
    copen
endfunction
command! Vet :call s:GoVet()

function! s:GoLint()
    cexpr system("golint " . shellescape(expand('%')))
    copen
endfunction
command! Lint :call s:GoLint()

" TagBar plugin
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
