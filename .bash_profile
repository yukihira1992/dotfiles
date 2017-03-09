
# --------------------------------------
# terminal color
# --------------------------------------
alias ls='/usr/local/bin/gls --color=auto'
# eval $(gdircolors ~/dircolors-solarized/dircolors.256dark)
# eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-universal)
# eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-dark)
eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-light)
export PS1='\[\e[33m\]\u \[\e[37m\]\t \w \[\e[31m\] $ '

# --------------------------------------
# vi mode
# --------------------------------------
set -o vi

# --------------------------------------
# pyenv
# --------------------------------------
export PYENV_ROOT=~/.pyenv
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH=$PATH:$PYENV_ROOT/bin:$PATH
export PATH=$PATH:~/bin
if builtin type pyenv >/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if builtin type pyenv-virtualenv >/dev/null 2>&1; then eval "$(pyenv virtualenv-init -)"; fi

# --------------------------------------
# anyenv
# --------------------------------------
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# --------------------------------------
# bash-completion
# --------------------------------------
if [ -f /usr/local/Cellar/bash-completion/1.3_1/etc/profile.d/bash_completion.sh ]; then
  . /usr/local/Cellar/bash-completion/1.3_1/etc/profile.d/bash_completion.sh
fi

# --------------------------------------
# unicode setting
# --------------------------------------
export PATH=$PATH:/usr/local/bin
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# --------------------------------------
# rmtrash
# --------------------------------------
alias rm='rmtrash'

# --------------------------------------
# weather report
# --------------------------------------
alias weather='curl -4 http://wttr.in/Tokyo'

# --------------------------------------
# brew-file
# --------------------------------------
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# --------------------------------------
# adb
# --------------------------------------
export PATH=$PATH:/Users/hirayamatakayuki/Library/Android/sdk/platform-tools/

# --------------------------------------
# Google search from terminal
# --------------------------------------
google(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.co.jp/search?q=${*// /+}"
    local app="/Applications"
    local c="${app}/Google Chrome.app"
    local f="${app}/Firefox.app"
    local s="${app}/Safari.app"
    case ${opt} in
        "-c")   open "${url}" -a "$c";;
        "-f")   open "${url}" -a "$f";;
        "-s")   open "${url}" -a "$s";;
        *)      open "${url}" -a "$s";;
    esac
}

# --------------------------------------
# PostgreSQL
# --------------------------------------
export PGDATA=/usr/local/var/postgres

# --------------------------------------
# neovim
# --------------------------------------
export XDG_CONFIG_HOME=~/.config

# --------------------------------------
# plantuml
# --------------------------------------
export PLANTUML_LIMIT_SIZE=8192

