" Go to the first file in the first block
" find a declaration here
" save the name of the istance and append a -> if it is a pointer
" or a . if not
" append the func name
" search in the block the string
"
" search the declaration outside block (global variable)
" append -> or .
" search in every file with '#include "' . g:var_file . ''

function! GetLevel(lnum)
	" Save current line
	let l:position = getpos('.')
	let l:level = 0
	call cursor(a:lnum, 1)
	while search('[{}]', 'bW')
		if synIDattr(synID(line('.'), 1, 0), "name") !~? "comment"
			if getline('.')[col('.')-1] == '{'
				let l:level += 1
			else
				let l:level -= 1
			endif
		endif
	endwhile
	call cursor(l:position[1], l:position[2])
	return l:level
endfunction

function! SetCppStyle()
	set foldmethod=expr
	set foldexpr=GetLevel(v:lnum)
endfunction

augroup cpp_style
	autocmd!
	autocmd FileType cpp,java,javascript execute SetCppStyle()
augroup END
