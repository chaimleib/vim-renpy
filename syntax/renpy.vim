" Vim syntax file
" Language:	Renpy script
" Maintainer:	MusashiAharon <astrochess@gmail.com>
" Last Change:	2011 Oct 9
" Features:	Spell-checking (must enable), auto-indenting, TODOs, string tags and interpolations

" Based on work by Spiky Caterpillar, http://spikycaterpillar.com/renpy.vim


if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn include @Python syntax/python.vim
unlet b:current_syntax

" Hitting return in an indented section should autoindent four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Numbers
syn match renpyNumber "-\?\d\+\(\.\d\+\)\?"
syn match renpyNumber "-\?\.\d\+"

" Variable and label names
syn match renpyIdentifier "[_a-zA-Z][_a-zA-Z0-9]*"

" String commands and escaped characters
syn match renpyEscape +\\['"%]+ contained 
syn match renpyEscape +{/\?[ibsu]}+ contained
syn match renpyEscape +{/\?plain}+ contained
syn match renpyEscape +{\(p\|fast\|nw\|w\)}+ contained
syn match renpyEscape +{\(font\|a\|color\|w\)=[^}]*}+ contained
syn match renpyEscape +{/\(font\|a\|color\|w\)}+ contained
syn match renpyEscape +{/\?=[^}]*}+ contained
syn match renpyEscape +{{+ contained

" Additions for Python strings
syn match pythonEscape +{/\?[ibsu]}+ contained
syn match pythonEscape +{/\?plain}+ contained
syn match pythonEscape +{\(p\|fast\|nw\|w\)}+ contained
syn match pythonEscape +{\(font\|a\|color\|w\)=[^}]*}+ contained
syn match pythonEscape +{/\(font\|a\|color\|w\)}+ contained
syn match pythonEscape +{/\?=[^}]*}+ contained
syn match pythonEscape +{{+ contained

" New in Renpy 6.13: square-bracket string interpolation
syn region renpyEscape start=+\[+ end=+\]+ contained
syn match renpyEscape +\[\[+ contained

" Strings
syn region renpyString start=+'+ end=+'+ skip=+\\'+ contains=renpyEscape,@Spell
syn region renpyString start=+"+ end=+"+ skip=+\\"+ contains=renpyEscape,@Spell

" Comments
syn match renpyComment "#.*$" contains=renpyTodo,@Spell
syn keyword renpyTodo FIXME TODO NOTE NOTES XXX contained

" Tabs not allowed in Renpy
syn match renpySpaceError "\t"

" Operators, keywords and special functions
syn keyword renpyStatement init image python early transform
syn keyword renpyStatement hide show scene
syn keyword renpyStatement menu jump call
syn keyword renpyStatement define return
syn keyword renpyOperator with at from 
syn keyword renpyOperator behind fadein fadeout expression 
syn keyword renpyOperator channel frames loop alpha
syn keyword renpyOperator xpos ypos xanchor yanchor zoom xzoom yzoom xalign yalign
syn keyword renpyStatement play stop queue
syn keyword renpyOperator sound music
syn keyword renpyFunction Dissolve DynamicDisplayable Fade Fixed Frame
syn keyword renpyFunction Pause
syn keyword renpyFunction ImageDissolve Position RotoZoom 
syn keyword renpyFunction Solid SplineMotion Style Text
syn match renpyStatement "label" display nextgroup=renpyIdentifier skipwhite

" Special variables
syn keyword renpyBuiltin left right center 
syn keyword renpyBuiltin moveinright moveinleft moveoutright moveoutleft 
syn keyword renpyBuiltin moveoutbottom moveinbottom moveouttop moveintop
syn keyword renpyBuiltin bg black text pause linear
syn keyword renpyBuiltin dissolve fade hpunch vpunch rotate flip


" Python lines ($)
syn region pythonStatement start="\$" end="$" contains=@Python

" Renpy-specific Python functions and variables
syn keyword pythonFunction Animation Character Null
syn keyword pythonFunction ShowingSwitch
syn match pythonFunction "anim\.\(Edge\|SMAnimation\|State\|TransitionAnimation\)"
syn match pythonFunction "anim\.Filmstrip"
syn match pythonFunction "im\.Composite"
syn match pythonFunction "im\.Crop"
syn match pythonFunction "im\.\(FactorScale\|Flip\|Grayscale\)"
syn match pythonFunction "im\.Image"
syn match pythonFunction "im\.MatrixColor"
syn match pythonFunction "im\.matrix\.\(brightness\|contrast\|hue\|invert\|saturation\)"
syn match pythonFunction "im\.Scale"
syn match pythonFunction "layout\.imagemap_main_menu"
syn match pythonFunction "layout\.button_menu"
syn match pythonFunction "renpy\.block_rollback"
syn match pythonFunction "renpy\.\(call_in_new_context\|curry\)"
syn match pythonFunction "renpy\.hide"
syn match pythonFunction "renpy\.\(jump_out_of_context\|jump\)"
syn match pythonFunction "renpy\.music\.\(play\|stop\|queue\|register_channel\|set_volume\)"
syn match pythonFunction "renpy\.pause"
syn match pythonFunction "renpy\.redraw"
syn match pythonFunction "renpy\.random\.\(choice\|randint\)"
syn match pythonFunction "renpy\.restart_interaction"
syn match pythonFunction "renpy\.\(scene\|show\)"
syn match pythonFunction "renpy\.showing"
syn match pythonFunction "renpy\.transition"
syn match pythonFunction "theme\.roundrect"
syn match pythonFunction "ui\.add"
syn match pythonFunction "ui\.\(bar\|button\)"
syn match pythonFunction "ui\.clear"
syn match pythonFunction "ui\.close"
syn match pythonFunction "ui\.\(fixed\|frame\|grid\)"
syn match pythonFunction "ui\.hbox"
syn match pythonFunction "ui\.image"
syn match pythonFunction "ui\.imagebutton"
syn match pythonFunction "ui\.imagemap"
syn match pythonFunction "ui\.interact"
syn match pythonFunction "ui\.\(keymap\|layer\)"
syn match pythonFunction "ui\.null"
syn match pythonFunction "ui\.remove"
syn match pythonFunction "ui\.returns"
syn match pythonFunction "ui\.text"
syn match pythonFunction "ui\.textbutton"
syn match pythonFunction "ui\.timer"
syn match pythonFunction "ui\.\(vbox\|window\)"

hi def link renpyNumber		Number
hi def link renpyString		String
hi def link renpyEscape		Special
hi def link renpyComment	Comment
hi def link renpyTodo		Todo
hi def link renpyStatement	Statement
hi def link renpyFunction	Function
hi def link renpyBuiltin	Identifier
hi def link renpyIdentifier Identifier
hi def link renpyOperator	Operator
hi def link renpySpaceError	Error

let b:current_syntax = "renpy"
