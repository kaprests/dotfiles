# Adds Julia to path
set -gx PATH ~/bin/julia-1.4.0/bin/ $PATH

# Vulkan env. var
set -gx VULKAN_SDK ~/vulkan/1.2.135.0/x86_64
set -gx PATH $VULKAN_SDK/bin $PATH
set -gx LD_LIBRARY_PATH $VULKAN_SDK/lib
set -gx VK_LAYER_PATH $VULKAN_SDK/etc/vulkan/explicit_layer.d


# Set dotfiles alias 
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
