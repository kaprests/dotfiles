# Aliases
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias ff='cd (fd --type directory | fzf)'
#thefuck --alias | source
alias ls='eza'
#switch (uname)
#    case Darwin
#        alias python='python3'
#end

# Opt out of MS/dotnet telemetry shait
# Not sure if all of these are needed, but better safe than sorry :')
# TODO: Consider separating out work related stuff (i.a. MacOS and MS stuff)
set -gx FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT true
set -gx DOTNET_HTTPREPL_TELEMETRY_OPTOUT true
set -gx DOTNET_CLI_TELEMETRY_OPTOUT true

# Gemini Enterprise Agent Platform (formelry Vertex AI)
set -gx GOOGLE_CLOUD_PROJECT "applied-ai-106502"
set -gx VERTEX_LOCATION "global"

# Basic config
set fish_greeting                       # Supresses fish intro message
set TERM "xterm-256color"               # Sets the terminal type
set -gx SUDO_EDITOR nvim
set -gx EDITOR nvim
fish_vi_key_bindings                    # vi mode

# Podman Docker compatibility (LazyDocker, Testcontainers)
set -gx DOCKER_HOST unix:///run/user/(id -u)/podman/podman.sock
#set -gx DOCKER_HOST unix://(podman info --format '{{.Host.RemoteSocket.Path}}')
#set -gx DOCKER_API_VERSION 1.40
# Podman compatibility with Docker tools etc.
# Note: also must enable: systemctl enable --now podman.socket
# Or run: podman system service --time=0 &

# Path -- universal
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/.config/scripts
fish_add_path $HOME/.dotnet/tools
switch (uname)
    # macos
    case Darwin
        fish_add_path /opt/homebrew/bin/
        fish_add_path /opt/homebrew/opt/curl/bin
        fish_add_path /Users/kaprests/.cargo/bin
end

function fish_user_key_bindings
    switch $TERM
        case rxvt-unicode-256color
            bind --preset -M insert \cH backward-kill-path-component # Not tested this case
            # clear commandline with ctrl+n
            bind --preset -M insert \cn clear-screen
        case xterm-256color
            bind --preset -M insert \b backward-kill-path-component
            # clear commandline with ctrl+n
            bind --preset -M insert \cn clear-screen
    end
end


# forgit
#[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.fish ]; and source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.fish

# plugins (look for better setup)
# Install: fisher 
# then
# fisher install jhillyerd/plugin-git
# (https://github.com/jhillyerd/plugin-git)
mise activate fish | source
