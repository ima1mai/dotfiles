# fisherman settings
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

#shell
set SHELL (which fish)
set -x LANG en_US.UTF-8 
set -x LC_ALL en_US.UTF-8    

# Powerline
#set -g theme_display_k8s_context yes
#set -g theme_display_virtualenv no
#set -g theme_color_scheme dracula
#set -g theme_project_dir_length 1

# fzf
set FZF_LEGACY_KEYBINDINGS 0

#pyenv
if test (uname) = "Linux"
    set -x PATH $HOME/".pyenv/bin" $PATH
end
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

#neovim
balias vi nvim

#kubectl
balias k 'kubectl'
balias kube 'kubectl'
balias kc 'kubectx'

#git
balias gp 'git pull'
balias gc 'git commit'
balias ga 'git add .'
balias gb 'git branch'
balias gst 'git status'

# colorls
balias lc 'colorls -lA --sd -t -r'
balias lctr 'colorls -lA --sd'
balias lct 'colorls --tree --git-status'
balias cls 'colorls'

set -x XDG_CONFIG_HOME ~/.config
set -q local_config; or set local_config $XDG_CONFIG_HOME/fish/config_local.fish
if test -e $local_config
    source $local_config
end
