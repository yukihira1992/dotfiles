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

function _parse_hub_number
    sed -E "s/[^0-9]*([0-9]*).*/\1/"
end

function issues
    open (hub browse --url -- issues)/(hub issue --limit 50 | peco | _parse_hub_number)
end

function prs
    hub pr show (hub pr list --limit 50 | peco | _parse_hub_number)
end


############
# Aliases
############

if has_command qrencode
    alias qr="qrencode -t ANSI"
end

if has_command trash
    alias rm="trash"
end

if has_command peco
    alias gsw="git branch -a | peco | xargs git checkout"
    alias gdl="git branch | peco | xargs git branch -D"
    alias ghqcd="cd (ghq root)/(ghq list | peco)"
    alias dockerexec="docker exec -it (docker ps --format '{{.Names}}' | peco) "
end

if has_command brew
    alias brew="set PATH /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin; /usr/local/bin/brew"
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

if has_command direnv
    direnv hook fish | source
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

set -x JAVA_HOME (/usr/libexec/java_home)
set -x PATH $JAVA_HOME/bin $PATH
set -x GRADLE_HOME /Library/gradle/gradle-3.2
set -x PATH $GRADLE_HOME/bin $PATH
set -x PATH $HOME/bin $PATH

fish_vi_key_bindings


source /Users/takayuki/.docker/init-fish.sh || true # Added by Docker Desktop
mise activate fish | source
