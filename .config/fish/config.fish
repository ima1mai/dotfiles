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

# homebrew
if test (uname) = "Darwin"
    eval (/opt/homebrew/bin/brew shellenv)
end

# fzf
set FZF_DEFAULT_OPTS "--height 40%"
set FZF_PREVIEW_DIR_CMD "ls"
set FZF_PREVIEW_FILE_CMD "head -n 10"
set FZF_TMUX_HEIGHT "40%"
# Open the selected file with the $EDITOR.
# set -gx $EDITOR "nvim" # or "vim", or "code", etc.
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

#pyenv
if test (uname) = "Linux"
    set -x PATH $HOME/".pyenv/bin" $PATH
end
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PYENV_ROOT/shims $PATH
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

#utility
alias urldecode "python -c \"import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))\""
alias urlencode "python -c \"import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))\""

# golang
# ~/go is the default GOPATH
# set -x GOPATH ~/go
# set -x PATH $HOME/"go/bin" $PATH

#neovim
balias vi nvim

#kubectl
balias k 'kubectl'
balias kube 'kubectl'
balias kc 'kubectx'
balias kgp 'kubectl get pod'
balias kg 'kubectl get'
balias kd 'kubectl describe'
balias kdp 'kubectl describe pod'
balias ogp 'oc get pod'
balias og 'oc get'
balias od 'oc describe'
balias odp 'oc describe pod'

#git
balias gp 'git pull'
balias gc 'git commit'
balias ga 'git add'
balias gb 'git branch'
balias gst 'git status'

# ls extentions
if type -q exa
    # exa
    balias ls 'exa --icons'
    balias ll 'exa --long --header --sort modified --icons'
    balias l 'll'
    balias la 'exa --long --header --sort modified --icons --all'
else if type -q colorls
    # colorls
    balias lc 'colorls -lA --sd -t -r'
    balias lctr 'colorls -lA --sd'
    balias lct 'colorls --tree --git-status'
    balias cls 'colorls'
else
    #ls
    balias l 'ls -ltrh'
    balias la 'ls -ltrha'
end

# watch command alternative
if type -q viddy
    # viddy
    balias watch 'viddy'
end

# alternative of ghq look
balias gl 'cd (ghq list -p | fzf)'

set -x XDG_CONFIG_HOME ~/.config
# local scripts
set -q local_config; or set local_config $XDG_CONFIG_HOME/fish/config_local.fish
if test -e $local_config
    source $local_config
end

set -x PATH $HOME/"bin" $PATH

# asdf
if test -e (brew --prefix asdf)/libexec/asdf.fish
    source (brew --prefix asdf)/libexec/asdf.fish
end

starship init fish | source
