# Aliases
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias ff='cd (fd --type directory | fzf)'
thefuck --alias | source
#switch (uname)
#    case Darwin
#        alias python='python3'
#end

# Opt out of MS/dotnet telemetry shait
# Not sure if all of these are needed, but better safe than sorry :')
# TODO: Consider separating out work related stuff (i.a. MacOS and MS stuff)
set FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT true
set DOTNET_HTTPREPL_TELEMETRY_OPTOUT true
set DOTNET_CLI_TELEMETRY_OPTOUT true

# Basic config
set -U fish_user_paths $fish_user_paths $HOME/.local/bin
set fish_greeting                       # Supresses fish intro message
set TERM "xterm-256color"               # Sets the terminal type
fish_vi_key_bindings                    # vi mode

# Path -- universal
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/.config/scripts
fish_add_path $HOME/.dotnet/tools
switch (uname)
    # macos
    case Darwin
        fish_add_path /opt/homebrew/bin/fish
        fish_add_path /opt/homebrew/bin/brew
        fish_add_path /opt/homebrew/opt/curl/bin
        fish_add_path /Users/kaprests/.cargo/bin
end

function fish_user_key_bindings
    switch $TERM
        case rxvt-unicode-256color
            bind --preset -M insert \cH backward-kill-path-component # Not tested this case
        case xterm-256color
            bind --preset -M insert \b backward-kill-path-component
    end
end

pyenv init - | source
