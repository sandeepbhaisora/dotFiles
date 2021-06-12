"
"plugins 
"
"install vim plug first
"
"========================================================
"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-lug/master/plug.vim'
"========================================================
"
"
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'vifm/vifm.vim'
    Plug 'junegunn/limelight.vim'
		Plug 'drewtempelmeyer/palenight.vim'
    " requires node installed pacman -S nodejs npm(for arch)
    " :CocInstall coc-clangd for c++ after installation only if using clangd instead of ccls
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'sheerun/vim-polyglot'
" Syntax
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
" Color-schemes
    Plug 'morhetz/gruvbox' "My favorite theme
		Plug 'mikelue/vim-maven-plugin'
    Plug 'simnalamburt/vim-mundo'
    Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
call plug#end()

"
"    cpp suff for cp not my own 
"
" important option that should already be set!
set hidden
set background=dark
colorscheme palenight
" available options:
" * g:split_term_style
" * g:split_term_resize_cmd

let g:split_term_style = 'vertical'
let g:os = substitute(system('uname'), '\n', '', '')
function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec buffercmd
	exec 'term ' . a:command
	exec 'setlocal nornu nonu'
	exec 'startinsert'
endfunction


function! CallPy(c) abort
    let buffercmd = 'vnew'
    exec buffercmd
    exec 'term ' . a:c
    exec 'startinsert'
	exec 'setlocal nornu nonu'
endfunction

command! -nargs=0 RunPy call CallPy(printf('python %s',expand('%')))
command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++11 %s && ./a.out', expand('%')))
autocmd FileType cpp nnoremap <leader>fr :CompileAndRun<CR>

" For those of you that like to use the default ./a.out
" This C++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
" NOTE: this version is more stable than the other version with specified
" output executable!
augroup CppToolkit
	autocmd!
	if g:os == 'Darwin'
		autocmd FileType cpp nnoremap <leader>fn :!g++ -std=c++11 -o %:r % && open -a Terminal './a.out'<CR>
	endif
	autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++11 % && ./a.out<CR>
	autocmd FileType cpp nnoremap <leader>fr :!./a.out<CR>
	autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>
augroup END

" For those of you that like to use -o and a specific outfile executable
" (i.e., xyz.cpp makes executable xyz, as opposed to a.out
" This C++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
augroup CppToolkit
	autocmd!
	if g:os == 'Darwin'
		autocmd FileType cpp nnoremap <leader>fn :!g++ -std=c++11 -o %:r % && open -a Terminal './%:r'<CR>
	endif
	autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++11 -o %:r % && ./%:r<CR>
	autocmd FileType cpp nnoremap <leader>fr :!./%:r.out<CR>
augroup END





source $HOME/.config/nvim/general/settings.vim

source $HOME/.config/nvim/keys/mappings.vim
