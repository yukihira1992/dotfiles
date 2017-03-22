# --------------------------------------
# load ~/.bashrc
# --------------------------------------
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# --------------------------------------
# terminal color and prompt
# --------------------------------------
if type gls > /dev/null 2>&1; then
    alias ls='/usr/local/bin/gls --color=auto'
fi
if type gdircolors > /dev/null 2>&1; then
    # eval $(gdircolors ~/dotfiles/dircolors-solarized/dircolors.256dark)
    # eval $(gdircolors ~/dotfiles/dircolors-solarized/dircolors.ansi-universal)
    # eval $(gdircolors ~/dotfiles/dircolors-solarized/dircolors.ansi-dark)
    eval $(gdircolors ~/dotfiles/dircolors-solarized/dircolors.ansi-light)
    export PS1='\[\e[0;33m\]\u \[\e[0;37m\]\t \w \[\e[0;31m\] $ \[\e[1;35m\]'
fi

# --------------------------------------
# pyenv
# --------------------------------------
if type pyenv > /dev/null 2>&1; then
    export PYENV_ROOT=~/.pyenv
    # export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    export PATH=$PATH:$PYENV_ROOT/bin:$PATH
    export PATH=$PATH:~/bin
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# --------------------------------------
# anyenv
# --------------------------------------
if type anyenv > /dev/null 2>&1; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# --------------------------------------
# unicode setting
# --------------------------------------
export PATH=$PATH:/usr/local/bin
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# --------------------------------------
# enable adb commands everywhere
# --------------------------------------
export PATH=$PATH:/Users/hirayamatakayuki/Library/Android/sdk/platform-tools/

# --------------------------------------
# PostgreSQL
# --------------------------------------
export PGDATA=/usr/local/var/postgres

# --------------------------------------
# neovim config path
# --------------------------------------
export XDG_CONFIG_HOME=~/dotfiles

# --------------------------------------
# plantuml buffer size
# --------------------------------------
export PLANTUML_LIMIT_SIZE=8192

