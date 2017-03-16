# --------------------------------------
# use vi mode
# --------------------------------------
set -o vi

# --------------------------------------
# enable bash-completion
# --------------------------------------
if [ -f /usr/local/Cellar/bash-completion/1.3_1/etc/profile.d/bash_completion.sh ]; then
  . /usr/local/Cellar/bash-completion/1.3_1/etc/profile.d/bash_completion.sh
fi

# --------------------------------------
# use rmtrash command instead of rm
# --------------------------------------
if type rmtrash > /dev/null 2>&1; then
    alias rm='rmtrash'
fi

# --------------------------------------
# weather report
# --------------------------------------
if type curl > /dev/null 2>&1; then
    alias weather='curl -4 http://wttr.in/Tokyo'
fi

# --------------------------------------
# brew-file
# --------------------------------------
if [ -f $(brew --prefix)/etc/brew-wrap ];then
    source $(brew --prefix)/etc/brew-wrap
fi

