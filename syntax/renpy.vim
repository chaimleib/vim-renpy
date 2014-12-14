" Vim syntax file
" Language:	Renpy script
" Maintainer:	MusashiAharon <astrochess@gmail.com>
" Last Change:	2014 Dec 14
" Features:	Spell-checking (must enable), auto-indenting, TODOs, string tags and interpolations

" Based on work by Spiky Caterpillar, http://spikycaterpillar.com/renpy.vim


if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn include @Python syntax/python.vim
unlet b:current_syntax
"runtime! syntax/python.vim


" Hitting return in an indented section should autoindent four spaces
set tabstop=4
set shiftwidth=4
set expandtab


"Comments
syn match renpyComment "#.*$" contains=renpyTodo,@Spell
syn keyword renpyTodo FIXME TODO NOTE NOTES XXX contained

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

" Operators, keywords and special functions
""" Block
syn keyword renpyStatement transform screen
""" Text
syn keyword renpyFunction Style Text
""" Image
syn keyword renpyStatement image hide show scene
syn keyword renpyOperator with
syn keyword renpyOperator as at behind onlayer zorder
""" Flow Control
syn match renpyStatement /\s*jump/ nextgroup=renpyIdentifier skipwhite
syn keyword renpyStatement menu return
syn match renpyStatementCall /^\s*call/ skipwhite nextgroup=renpyStatementCallFrom,renpyIdentifier
syn keyword renpyStatementCallFrom from skipwhite nextgroup=renpyIdentifier

syn keyword renpyStatement if elif else
""" Sound Voice & Music
syn keyword renpyStatement play stop queue
syn keyword renpyOperator channel frames loop
syn keyword renpyStatement voice sustain
syn keyword renpyOperator sound music
syn keyword renpyOperator fadein fadeout
""" Other
syn keyword renpyStatement define
syn keyword renpyOperator expression

" ATL

""" ATL: on & event Statenent
syn keyword renpyStatement event
syn keyword renpyStatement on nextgroup=renpyEvent skipwhite
syn keyword renpyEvent start show hide contained
syn keyword renpyEvent replace replaced
syn keyword renpyEvent hover idle selected_hover selected_idle contained
""" ATL: Interpolation Statemant & Warpers
syn keyword renpyStatement pause linear ease easein easeout
""" ATL: Circular Motion
syn keyword renpyOperator warp knot clockwise counterclockwise circles
""" ATL: Block (complex) Statement
syn keyword renpyStatement choice function parallel block
syn keyword renpyStatement contains
""" ATL: simple Statement
syn keyword renpyStatement time pass repeat
""" ATL: Displayable Transform Properties
syn keyword renpyOperator pos xpos ypos
syn keyword renpyOperator anchor xanchor yanchor
syn keyword renpyOperator align xalign yalign
syn keyword renpyOperator xcenter ycenter
syn keyword renpyOperator flip rotate rotate_pad
syn keyword renpyOperator zoom xzoom yzoom
syn keyword renpyOperator alpha
syn keyword renpyOperator around alignaround
syn keyword renpyOperator angle radius
syn keyword renpyOperator crop corner1 corner2
syn keyword renpyOperator size
syn keyword renpyOperator subpixel
syn keyword renpyOperator delay

" Screen

""" Screen: UI Statement properties
syn keyword renpyOperator at default id style style_group focus
""" Screen: UI Statement
syn keyword renpyStatement add
syn keyword renpyStatement bar vbar
syn keyword renpyStatement button textbutton imagebutton mousearea imagemap
syn keyword renpyStatement fixed frame grid hbox vbox side window null
syn keyword renpyStatement input key timer transform
syn keyword renpyStatement viewport hotspot hotbar
syn keyword renpyStatement text
syn keyword renpyStatement has
""" Screen: Control Statement
syn keyword renpyStatement default for if elif else use on
syn keyword renpyOperator in not


" Function

""" Transition Function
syn keyword renpyFunction AlphaDissolve ComposeTransition CropMove Dissolve
syn keyword renpyFunction Fade ImageDissolve MoveTransition MultipleTransition
syn keyword renpyFunction Pause Pixellate
syn keyword renpyFunction Position RotoZoom
syn keyword renpyFunction SplineMotion
""" Displayable Function
syn keyword renpyFunction Image Frame LiveCrop LiveTile Null Solid
syn keyword renpyFunction ConditionSwitch DynamicDisplayable ShowingSwitch
syn keyword renpyFunction Fixed HBox VBox
""" Other Image Function
syn keyword renpyFunction At AlphaBlend

" Special variables

""" Default Transforms
syn keyword renpyBuiltin left right center truecenter topleft top topright
syn keyword renpyBuiltin offscreenleft offscreenright default reset
""" Pre-Defined Transitions
syn keyword renpyBuiltin fade dissolve pixellate
syn keyword renpyBuiltin move moveinright moveinleft moveintop moveinbottom
syn keyword renpyBuiltin moveoutright moveoutleft moveouttop moveoutbottom
syn keyword renpyBuiltin ease easeinright easeinleft easeintop easeinbottom
syn keyword renpyBuiltin easeoutright easeoutleft easeouttop easeoutbottom
syn keyword renpyBuiltin zoomin zoomout zoominout
syn keyword renpyBuiltin vpunch hpunch
syn keyword renpyBuiltin blinds squares
syn keyword renpyBuiltin wipeleft wiperight wipeup wipedown
syn keyword renpyBuiltin slideleft slideright slideup slidedown
syn keyword renpyBuiltin slideawayleft slideawayright slideawayup slideawaydown
syn keyword renpyBuiltin irisin irisout
""" Pre-Defined Displayable
syn keyword renpyBuiltin bg black text pause linear

" Python lines ($)
syn region renpyPythonStatement start="\s*\$" end="$" contains=@Python,renpyPythonStatementMarker
syn match renpyPythonStatementMarker /\$/

" Renpy-specific Python functions and variables
syn keyword pythonFunction Animation Character Null
syn keyword pythonFunction ShowingSwitch
syn keyword pythonBuiltin config
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



"Renpy block headers
syn region renpyHeader oneline keepend
    \ start="^\s*\(init\|early\|transform\|label\|animate\)"
    \ end=":"
    \ contains=renpyHeaderFByPriority,renpyHeaderFById,renpyHeaderPriority,renpyIdentifier, renpyArgs

""label/transform <identifier> <args>
syn keyword renpyHeaderFById label transform animate  contained skipwhite
    \ nextgroup=renpyHeaderIdentifier

syn match renpyHeaderIdentifier contained transparent /[_a-zA-Z][_a-zA-Z0-9]*/
    \ nextgroup=renpyHeaderArgs

syn region renpyHeaderArgs contained
    \ start="("
    \ end=")"
    \ contains=renpyIdentifier,renpyNumber,renpyString

syn match renpyHeaderFByPriority /init\|early/ contained skipwhite
    \ nextgroup=renpyHeaderPriority

syn match renpyHeaderPriority /-\?\d\+/ contained skipwhite
    \ nextgroup=renpyHeaderPython

"Python blocks
"TODO: find better way to handle indents
""Indent level 0
syn region renpyPythonBlock0 keepend
    \ start="^\(\(init\|early\)\s\+\(-\?\d\+\s\+\)\?\)\?python.*:"
    \ end="^[^ ]"me=s-1
    \ contains=@Python,renpyPythonHeader0,pythonComment

syn region renpyPythonHeader0 oneline contained
    \ start="^\([^ ]\+ \+\)*python"
    \ end=":"
    \ contains=renpyHeaderFByPriority,renpyHeaderPriority,renpyHeaderPython,renpyHeaderModifier

"Indent level 1
syn region renpyPythonBlock1 keepend
    \ start="^    \(\(init\|early\)\s\+\(-\?\d\+\s\+\)\?\)\?python.*:"
    \ end="^[^ ]"me=s-1
    \ contains=@Python,renpyPythonHeader1,pythonComment

syn region renpyPythonHeader1 oneline contained
    \ start="^    \([^ ]\+ \+\)*python"
    \ end=":"
    \ contains=renpyHeaderFByPriority,renpyHeaderPriority,renpyHeaderPython,renpyHeaderModifier

"Indent level 2
syn region renpyPythonBlock2 keepend
    \ start="^        \(\(init\|early\)\s\+\(-\?\d\+\s\+\)\?\)\?python.*:"
    \ end="^[^ ]"me=s-1
    \ contains=@Python,renpyPythonHeader2,pythonComment

syn region renpyPythonHeader2 oneline contained
    \ start="^        \([^ ]\+ \+\)*python"
    \ end=":"
    \ contains=renpyHeaderFByPriority,renpyHeaderPriority,renpyHeaderPython,renpyHeaderModifier

"Indent level 3
syn region renpyPythonBlock3 keepend
    \ start="^        \(\(init\|early\)\s\+\(-\?\d\+\s\+\)\?\)\?python.*:"
    \ end="^[^ ]"me=s-1
    \ contains=@Python,renpyPythonHeader3,pythonComment

syn region renpyPythonHeader3 oneline contained
    \ start="^        \([^ ]\+ \+\)*python"
    \ end=":"
    \ contains=renpyHeaderFByPriority,renpyHeaderPriority,renpyHeaderPython,renpyHeaderModifier


syn keyword renpyHeaderPython python nextgroup=renpyHeaderModifier
syn keyword renpyHeaderModifier hide early

""Python block headers
"syn region renpyPythonBlockHeader oneline contained
"\ start="^\(init\|early\)"
"\ end=":"
"\ contains=renpyPythonBlockHeaderType,renpyPythonBlockHeaderPriority,renpyPythonBlockHeaderPython
"
"syn region renpyPythonBlockHeader oneline contained
"\ start="^\(    \)*python"
"\ end=":"
"\ contains=renpyPythonBlockHeaderType,renpyPythonBlockHeaderPriority,renpyPythonBlockHeaderPython
"
"syn match renpyPythonBlockHeaderType /init\|early/ contained skipwhite
"\ nextgroup=renpyPythonBlockHeaderPriority,renpyPythonBlockHeaderPython
"
"syn match renpyPythonBlockHeaderPriority /-\?\d\+/ contained skipwhite
"\ nextgroup=renpyPythonBlockHeaderPython
"
"syn match renpyPythonBlockHeaderPython /python/ contained skipwhite
""Python blocks
"syn region renpyPythonBlock keepend matchgroup=renpyPythonBlock
"\ start="^\(    \)*\(\(init\|early\) \+\(-\?\d\+ \+\)\?\)python\( \+hide\)\? *:"
"\ skip="^#"
"\ end=/^[^ ]/me=s-1
"\ contains=@Python,renpyPythonBlockHeader
"
"syn region renpyPythonBlock keepend matchgroup=renpyPythonBlock
"\ start="\([^ ]\+ \+\)*python *: *$"
"\ skip="^#"
"\ end=/^[^ ]/me=s-1
"\ contains=@Python,renpyPythonBlockHeader
"

"Highlight clusters for headers
hi def link renpyHeaderFByPriority  renpyHeaderKeyword
hi def link renpyHeaderFById        renpyHeaderKeyword
hi def link renpyHeaderModifier     renpyHeaderKeyword

"Header highlighting
hi def link renpyHeaderPython               Statement
hi def link renpyHeaderKeyword              Statement
hi def link renpyHeaderLabel                Statement
hi def link renpyHeaderPriority             Number

"Statements
hi def link renpyStatementCall              renpyStatement
hi def link renpyStatementCallFrom          renpyOperator
hi def link renpyPythonStatementMarker      renpyStatement

"Token highlighting
hi def link renpyNumber		Number
hi def link renpyString		String
hi def link renpyEscape		Special
hi def link renpyComment	Comment
hi def link renpyTodo		Todo
hi def link renpyStatement	Statement
hi def link renpyFunction	Function
hi def link renpyBuiltin	Identifier
hi def link renpyOperator	Operator
hi def link renpySpaceError	Error
hi def link renpyEvent      Identifier

let b:current_syntax = "renpy"

