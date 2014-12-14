vim-renpy
=========

Vim syntax highlighting for [Renpy][] script files.

Installing
----------
There are three components to installing a Vim syntax files:

1. The syntax files themselves.
2. The filetype recognizer. This notices when a .rpy file is loaded and tells vim to use the correct syntax file.
3. Syntax highlighting is enabled in Vim.

Generally speaking, the syntax folder can be put anywhere, but a suggested location is `~/.vim/syntax/`. Create the folders if they don't exist already, then copy the contents of `vim-renpy/syntax/` to your personal syntax folder.

To install the filetype reconizer, we just need to make sure that the contents of filetypes.vim are executed when Vim starts up. A flexible way to do this is to put filetypes.vim in `~/.vim/filetypes.vim`, and then adding this to `~/.vimrc`:

```
let file=expand("~/.vim/filetypes.vim")
if filereadable(file)
    silent! execute 'source '.file
endif
```

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

