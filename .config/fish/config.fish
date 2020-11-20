############
# Functions
############

function init_tmux
    if tmux ls | grep main:
        tmux a -t main
    else
        tmux new -s main
    end
end

function has_command
    type $argv > /dev/null 2>&1
end

function dirzip
    set target (basename $argv[1])
    zip -r {$target}.zip $target
end


############
# Aliases
############

if has_command qrencode
    alias qr="qrencode -t ANSI"
end

if has_command rmtrash
    alias rm="rmtrash"
end

if has_command peco
    alias gsw="git branch -a | peco | xargs git checkout"
    alias gdl="git branch | peco | xargs git branch -D"
    alias ghqcd="cd (ghq root)/(ghq list | peco)"
    alias dockerexec="docker exec -it (docker ps --format '{{.Names}}' | peco) "
end

##############
# Keybindings
##############

function fish_user_key_bindings
    bind -M insert \c] ghqcd force_repaint
end

############
# env
############

if has_command pyenv
    set -x PIPENV_VENV_IN_PROJECT 1
    pyenv init - --no-rehash | source
end

if has_command direnv
    eval (direnv hook fish)
end

#
# https://github.com/oh-my-fish/theme-bobthefish
#

set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_master_branch yes
set -g theme_display_docker_machine yes
set -g theme display_virtualenv yes

set -x LC_ALL ja_JP.UTF-8
set -x LANG ja_JP.UTF-8
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

fish_vi_key_bindings

