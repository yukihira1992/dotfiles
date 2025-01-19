#############################
# Homebrew for Apple Silicon
#############################

if test -d "/opt/homebrew"
    set --global --export HOMEBREW_PREFIX "/opt/homebrew";
    set --global --export HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set --global --export HOMEBREW_REPOSITORY "/opt/homebrew";
    fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin";
    if test -n "$MANPATH[1]"; set --global --export MANPATH '' $MANPATH; end;
    if not contains "/opt/homebrew/share/info" $INFOPATH; set --global --export INFOPATH "/opt/homebrew/share/info" $INFOPATH; end;

    set --global --export CPATH "/opt/homebrew/include";
    set --global --export LIBRARY_PATH "/opt/homebrew/lib";

    fish_add_path --global "/opt/homebrew/opt/trash/bin";
end


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

if has_command mise
    mise activate fish | source
end


# https://github.com/oh-my-fish/theme-bobthefish

set --global theme_display_git yes
set --global theme_display_git_dirty yes
set --global theme_display_git_master_branch yes
set --global theme_display_docker_machine yes
set --global theme display_virtualenv yes

set --export LC_ALL ja_JP.UTF-8
set --export LANG ja_JP.UTF-8
set --export GOPATH $HOME/go
set --export PATH $GOPATH/bin $PATH

# set -x JAVA_HOME (/usr/libexec/java_home)
set --export PATH $JAVA_HOME/bin $PATH
set --export GRADLE_HOME /Library/gradle/gradle-3.2
set --export PATH $GRADLE_HOME/bin $PATH
set --export PATH $HOME/bin $PATH

set --export SAML2AWS_IDP_PROVIDER Browser

fish_vi_key_bindings
