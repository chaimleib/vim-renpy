vim-renpy
=========

Vim syntax highlighting for [Renpy][] script files.

Installation
------------

### [NeoBundle](https://github.com/Shougo/neobundle.vim)
Just add the following line in your `.vimrc`:

```
NeoBundle 'chaimleib/vim-renpy'
```

### Manual Installation
There are three components to installing a Vim syntax file:

1. `./syntax/renpy.vim` - the syntax highlighting file.
2. `./ftdetect/renpy.vim` - detects when a `.rpy` file is loaded and tells vim to use the correct syntax file.
3. Make sure `syntax on` is in your `.vimrc` file.

### Step 1
Clone or download this repository and copy all the directories here in your `~/.vim`
directory.

### Step 2
If you haven't done so already, add

```
syntax on
```

to `~/.vimrc` as well.

### Other
This package *may* also run with other package managers like [Pathogen](https://github.com/tpope/vim-pathogen) or
[Vundle](https://github.com/gmarik/vundle), but it is still not tested.


Credits
-------
* Based on Spiky Caterpillar's [renpy.vim][SC renpy.vim]
* Modifications from:
    * [Civa Lin]
    * [Dimitry Solovyov]
    * [Jezeniel Zapanta]

[Renpy]: http://www.renpy.org/
[SC renpy.vim]: http://spikycaterpillar.com/renpy.vim
[Civa Lin]: https://bitbucket.org/civalin/
[Dimitry Solovyov]: https://github.com/disolovyov
[Jezeniel Zapanta]: https://github.com/jezenielzapanta

