function has_command
    type $argv > /dev/null 2>&1
end

if has_command pyenv
    set -x PATH $HOME/.pyenv/shims $PATH
    eval (pyenv init - | source)
end

if has_command rmtrash
    alias rm="rmtrash"
end

set -x LC_ALL ja_JP.UTF-8
set -x LANG ja_JP.UTF-8

#
# https://github.com/oh-my-fish/theme-bobthefish
#

set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_master_branch yes
set -g theme_display_docker_machine yes
set -g theme display_virtualenv yes

function fish_greeting
    if has_command figlet
        for message in " Praing Run" " Don't give up" " And" " Stay on your way"
            figlet -w120 -f ogre $message
        end
    else
        echo "Praying Run Don't give up And Stay on your way"
    end
end

function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
    bind \c] peco_select_ghq_repository
end

function is_tmux_running
    test ! -z "$TMUX"
end

function is_ssh_running
    test ! -z "$SSH_CONNECTION"
end

function tmux_auto_attach
    if is_tmux_running
        return 0
    end
    if is_ssh_running
        return 0
    end

    if has_command tmux; and status --is-interactive
        if tmux has-session > /dev/null 2>&1; and tmux list-sessions | grep -qE '.*]$'
            tmux attach-session
        else
            echo 'Tmux has no sessions'
            tmux
        end
    end
end

tmux_auto_attach