" 24 Aug 2020, since neuron.vim doesn't support custom CLI arguments.
" update: what if i just give up on this and frankenstein the neuron.vim plugin?

let g:zettel_dir = $PATH . '/Desktop/materials/Taproot'

function! EditZettelNew()
    let path = system('echo delme.txt')
    echom path
    edit g:path
    echom 'edit zettl new!'
endfunction

inoremap jzn <Esc>:call EditZettelNew()<CR>


"nm gzb <Plug>NeuronRibStart
"nm gzu <Plug>EditZettelLast
"nm gzl <Plug>InsertZettelLast
"nm gzz <Plug>EditZettelSelect
"nm gzi <Plug>InsertZettelSelect
"nm gzr <Plug>NeuronRefreshCache
"nm gzo <Plug>EditZettelUnderCursor

"echom 'Zettelkasten keybinds loaded.'

