# fisherman settings
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -g fisher_path ~/.config/fisherman

set fish_function_path $fish_function_path $fisher_path/functions
set fish_complete_path $fish_complete_path $fisher_path/completions

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end

#shell
set SHELL (which fish)

# Powerline
set -g theme_display_k8s_context yes
set -g theme_display_virtualenv yes

# fzf
set FZF_LEGACY_KEYBINDINGS 0

#pyenv
set -x PATH $HOME/".pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

#neovim
set XDG_CONFIG_HOME $HOME"/.config"
balias vi nvim

#kubectl
balias k 'kubectl'
balias kube 'kubectl'
