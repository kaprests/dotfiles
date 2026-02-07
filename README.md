# dotfiles
My dotfiles

## Installation 
* clone as a bare repo:

    `git clone --bare https://github.com/kaprests/dotfiles.git $HOME/.dotfiles`

* set dotfiles alias: 

    `alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

* checkout the content from repo to $HOME: 

    `dots checkout`
    
* Hide undtracked files

    `dots config --local status.showUntrackedFiles no`

* Copy `.config/userChrome.css` to Firefix profile directory
    Have not yet worked out a simple way to automate this. 

## Screenshots
![Empty-desktop](./Pictures/dotshots/empty-desktop.png)
![Terminals](./Pictures/dotshots/terminals.png)
![Firefox](./Pictures/dotshots/firefox.png)

Note:
Export list of explicitly installed stuff (pacman):

Everything from pacman, excluding i.a. AUR stuff
pacman -Qqe | grep -Fvx "$(pacman -Qqm)"

AUR stuff (and other foreign things):
pacman -Qqme
