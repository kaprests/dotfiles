# Adds Julia to path
set -gx PATH ~/bin/julia-1.4.0/bin/ $PATH

# Set dotfiles alias 
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
