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
export PS1='\u@\h:$(echo "\w" | sed -e "/^.\{20,\}$/s/^\(.\{10\}\).*\(.\{10\}\)$/\1...\2/")\$ '

# --------------------------------------
# pyenv
# --------------------------------------
if type pyenv > /dev/null 2>&1; then
    export PYENV_ROOT=~/.pyenv
    export PATH=$PATH:$PYENV_ROOT/bin:$PATH
    export PATH=$PATH:~/bin
    eval "$(pyenv init -)"

    # If you have homebrew openssl and pyenv installed,
    # you may need to tell the compiler where the openssl package is located:
    export CFLAGS="-I$(brew --prefix openssl)/include"
    export LDFLAGS="-L$(brew --prefix openssl)/lib"
fi

# --------------------------------------
# neovim config path
# --------------------------------------
export XDG_CONFIG_HOME=~/.config

# --------------------------------------
# plantuml
# --------------------------------------
export PLANTUML_LIMIT_SIZE=8192

