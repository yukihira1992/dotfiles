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
    alias ls='/usr/local/bin/gls --color=auto -h'
fi
if type gdircolors > /dev/null 2>&1; then
    # eval $(gdircolors ~/dotfiles/etc/dircolors-solarized/dircolors.256dark)
    # eval $(gdircolors ~/dotfiles/etc/dircolors-solarized/dircolors.ansi-universal)
    # eval $(gdircolors ~/dotfiles/etc/dircolors-solarized/dircolors.ansi-dark)
    eval $(gdircolors ~/dotfiles/etc/dircolors-solarized/dircolors.ansi-light)
    export PS1='\[\e[0;37m\]\t \[\e[0;34m\]\w \[\e[0;31m\] $ \[\e[1;35m\]'
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

    # If you have homebrew openssl and pyenv installed,
    # you may need to tell the compiler where the openssl package is located:
    export CFLAGS="-I$(brew --prefix openssl)/include"
    export LDFLAGS="-L$(brew --prefix openssl)/lib"
fi

# --------------------------------------
# anyenv
# --------------------------------------
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# --------------------------------------
# enable adb commands everywhere
# --------------------------------------
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/

# --------------------------------------
# PostgreSQL
# --------------------------------------
export PGDATA=/usr/local/var/postgres

# --------------------------------------
# neovim config path
# --------------------------------------
export XDG_CONFIG_HOME=~/.config

# --------------------------------------
# plantuml
# --------------------------------------
export PLANTUML_LIMIT_SIZE=8192

