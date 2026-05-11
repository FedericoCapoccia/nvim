let b:undo_indent = get(b:, 'undo_indent', '') . '|setlocal indentexpr<'

setlocal indentexpr=GetZigIndentFixed(v:lnum)

function! GetZigIndentFixed(lnum) abort
    let current_line = getline(a:lnum)

    if current_line =~# '\v^\s*};$'
        let prev_line_num = prevnonblank(a:lnum - 1)
        let prev_line = getline(prev_line_num)

        " The bundled Zig indent subtracts one shiftwidth for `};`, which
        " incorrectly sends empty struct initializers back to column zero.
        if prev_line =~# '{\s*$'
            return indent(prev_line_num)
        endif
    endif

    return GetZigIndent(a:lnum)
endfunction
