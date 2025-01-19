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
