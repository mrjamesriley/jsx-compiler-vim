" Language: JSX
" Maintainer: James Riley
" Description: Provides the ability to compile a file or visual selection from JSX to JS


function! s:SwitchToWindow(buffer)
  exec bufwinnr(a:buffer) 'wincmd w'
endfunction


function! s:BuildOutputBuffer()
  belowright new
  setlocal bufhidden=wipe buftype=nofile
  return bufnr('%')
endfunction


function! s:PutIntoBuffer(buffer, text)
  call s:SwitchToWindow(a:buffer)

  if bufnr('%') != a:buffer
    throw 'unable to switch to the output buffer'
  endif

  put! = a:text
endfunction


function! JsxCompile(startline, endline)
  " create the output buffer unless it already exists
  if bufwinnr(b:output_buffer) == -1
    let source_buffer = bufnr('%')
    let scratch_buffer = s:BuildOutputBuffer()

    call s:SwitchToWindow(source_buffer)
    let b:output_buffer = scratch_buffer
  endif

  " send source buffer contents to JSX compiler and grab the output
  let jsxCode = join(getline(a:startline, a:endline), "\n")
  let jsxCommand = 'node jsx-compile.js "' . jsxCode . '"'
  let text = system(jsxCommand)

  call s:PutIntoBuffer(b:output_buffer, text)
endfunction

if !exists('b:output_buffer')
  let b:output_buffer = -1
endif

command! -nargs=* -range=% -bar JsxCompile call JsxCompile(<line1>, <line2>)
