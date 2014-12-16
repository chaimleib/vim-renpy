vim-renpy
=========

Vim syntax highlighting for [Renpy][] script files.

Installing
----------
There are three components to installing a Vim syntax file:

1. The syntax file itself (`./syntax/renpy.py`)
2. The filetype recognizer (`./filetypes.vim`). This notices when a .rpy file is loaded and tells vim to use the correct syntax file.
3. Syntax highlighting is enabled in Vim. (`syntax on`)

### Step 1
Generally speaking, the syntax folder can be put anywhere, but a suggested location is `~/.vim/syntax/`. Create the folders if they don't exist already, then copy `./syntax/renpy.vim` to your personal `syntax` folder.

### Step 2
To install the filetype reconizer, we just need to make sure that the contents of `filetype.vim` are executed when Vim starts up. A flexible way to do this is to append `filetype.vim` to `~/.vim/filetype.vim`, creating the file if needed:

```
cat filetype.vim >> ~/.vim/filetype.vim
```

Vim automatically executes this file when it starts up.

### Step 3
If you haven't done so already, add

```
syntax on
```

to `~/.vimrc` as well.


Credits
-------
* Based on Spiky Caterpillar's [renpy.vim][SC renpy.vim]
* Modifications from [disolovyov's vim-renpy][D vim-renpy]

[Renpy]: http://www.renpy.org/
[SC renpy.vim]: http://spikycaterpillar.com/renpy.vim
[D vim-renpy]: https://github.com/disolovyov/vim-renpy

