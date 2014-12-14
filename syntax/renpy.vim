" Vim syntax file
" Language:	Renpy script
" Maintainer:	MusashiAharon <astrochess@gmail.com>
" Last Change:	2014 Dec 4
" Features:	Spell-checking (must enable), auto-indenting, TODOs, string tags and interpolations

" Based on work by Spiky Caterpillar, http://spikycaterpillar.com/renpy.vim


if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn include @Python syntax/python.vim
unlet b:current_syntax

syn include @RenpyBlockElements syntax/renpyBlockElements.vim
unlet b:current_syntax

" Hitting return in an indented section should autoindent four spaces
set tabstop=4
set shiftwidth=4
set expandtab
 
"Comments
syn match renpyComment "#.*$" contains=renpyTodo,@Spell
syn keyword renpyTodo FIXME TODO NOTE NOTES XXX contained

"Python block headers
syn region renpyPythonBlockHeader
\ start="^\(init\|early\)"
\ end=":"me=s-1
\ oneline
\ contains=renpyPythonBlockHeaderType,renpyPythonBlockHeaderPriority,renpyPythonBlockHeaderPython
\ contained

syn match renpyPythonBlockHeaderType /init\|early/
\ nextgroup=renpyPythonBlockHeaderPriority,renpyPythonBlockHeaderPython
\ contained
\ skipwhite

syn match renpyPythonBlockHeaderPriority /-\?\d\+/
\ nextgroup=renpyPythonBlockHeaderPython
\ contained
\ skipwhite

syn match renpyPythonBlockHeaderPython /python/
\ contained
\ skipwhite
"Python blocks
syn region renpyPythonBlock
\ start="^\(\(init\|early\) \+\(-\?\d\+ \+\)\?\)python\( \+hide\)\? *:"
\ skip="^#"
\ end=/^[^ ]/me=s-1
\ keepend
\ matchgroup=renpyPythonBlock
\ contains=@Python,renpyPythonBlockHeader

"Renpy block headers
syn region renpyBlockHeader oneline contained
\ start="^\(init\|early\)"
\ end=":"
\ contains=renpyBlockHeaderType,renpyBlockHeaderPriority

syn region renpyBlockHeader oneline contained
\ start="^label"
\ end=":"
\ contains=renpyBlockHeaderLabel,renpyIdentifier

syn match renpyBlockHeaderType /init\|early/ contained skipwhite
\ nextgroup=renpyBlockHeaderPriority

syn match renpyBlockHeaderPriority /-\?\d\+/ contained skipwhite

syn match renpyBlockHeaderLabel /label/ contained skipwhite
\ nextgroup=renpyIdentifier

"Renpy blocks
syn region renpyBlockEarlyInit
\ start="^\(early\|init\)\( \+-\?\d\+\)\? *:"
\ end=/^[^ ]/me=s-1
\ skip="^#"
\ keepend
\ matchgroup=renpyBlockEarlyInit
\ contains=@RenpyBlockElements,renpyComment,renpyBlockHeader

syn region renpyBlock
\ start="^label \+[_a-zA-Z][_a-zA-Z0-9]* *:"
\ end=/^[^ ]/me=s-1
\ skip="^#"
\ keepend
\ matchgroup=renpyBlock
\ contains=@RenpyBlockElements,renpyComment,renpyBlockHeader

hi def link renpyPythonBlockHeaderType          Statement
hi def link renpyPythonBlockHeaderPriority      Number
hi def link renpyPythonBlockHeaderPython        Statement
hi def link renpyBlockHeaderType                Statement
hi def link renpyBlockHeaderLabel               Statement
hi def link renpyBlockHeaderPriority            Number

let b:current_syntax = "renpy"

