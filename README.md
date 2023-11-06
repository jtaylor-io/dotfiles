# dotfiles

## Repo Structure [[inspiration](https://brandon.invergo.net/news/2011-05-26-using-gnu-stow-to-manage-your-dotfiles.html)]

Each top-level directory represents the configuration for a particular tool requiring config eg neovim.

The layout of the configuration inside of each top-level directory needs to maintain the structure required in your home-directory e.g.:

- required `home-directory` structure:

```
home-directory/
    .bashrc
    nvim/
        init.lua
```

- maps to this in `dotfile-repo-root`:

```
dotfile-repo-root/
    bash/
        .bashrc
    neovim/
        nvim/
            init.lua
```

## Installation

Uses [GNU stow](https://www.gnu.org/software/stow/) to manage required symlinks from home directory to dotfile repo.

Supplied `install.sh` script simply loops over all the top-level directories in dotfile root, running `stow` with the home-directory as it's `target`.

- clone this repo
- cd into clone
- run `$> ./install.sh`
