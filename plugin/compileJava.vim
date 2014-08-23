" Comments ------------------------------{{{
" javac -d bin -cp src:lib/l1.jar:lib/l2.jar -sourcepath src src/HelloWorld.java
" ./HelloWorld.java:	public static int main(String[] args) {
" grep \"public static [^ ]* main[ ]*(" . -R
" }}}
" Variables ----------------------{{{
let g:java_compile_path = ''
"}}}
"Functions -----------------------{{{
function! s:GetMainPath()
	let l:grep_result = system('grep "public static [^ ]* main[ ]*(" . -R')
	return split(l:grep_result, ':')[0]
endfunction

function! s:GetLibs()
	return join(add(split(system('find lib/ -type f -name *.jar'), "\n"), 'src'), ':')
endfunction

function! JavaCompile()
	let l:old_path = system('pwd')
	execute 'cd ' . g:java_compile_path
	if g:java_compile_path == ''
		execute 'cd ' . system('pwd')
	endif
	silent !clear
	execute "!javac -d bin -cp " . <SID>GetLibs() . " -sourcepath src " . <SID>GetMainPath()
	execute 'cd ' . l:old_path
endfunction
" }}}
" Commands -----------------{{{
command! JavaCompile call JavaCompile()
" }}}
