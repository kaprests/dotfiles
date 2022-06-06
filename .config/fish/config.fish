# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'

# Basic config
set -U fish_user_paths $fish_user_paths $HOME/.local/bin
set fish_greeting                       # Supresses fish intro message
set TERM "xterm-256color"               # Sets the terminal type
fish_vi_key_bindings                    # vi mode

# Path
fish_add_path $HOME/.emacs.d/bin

function fish_user_key_bindings
    switch $TERM
        case rxvt-unicode-256color
            bind --preset -M insert \cH backward-kill-path-component # Not tested this case
        case xterm-256color
            bind --preset -M insert \b backward-kill-path-component
    end
end
