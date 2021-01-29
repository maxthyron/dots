zmodload zsh/zprof
# Custom zsh folder
ZSH_CUSTOM=~/.zsh_custom

# Python PATH
export PATH=/Users/thyron/Library/Python/3.8/bin:$PATH

# JEnv PATH
export PATH="$HOME/.jenv/bin:$PATH"

# Disable homebrew update on install
export HOMEBREW_NO_AUTO_UPDATE=1

# iTerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Custom variables
export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILESIZE=5000
export HOMEBREW_NO_ANALYTICS=1

# Completion additions
autoload -U compinit && compinit
. $ZSH_CUSTOM/functions.zsh

# Disable nvm use command on startup
export NVM_NO_USE=true
export NVM_LAZY_LOAD=true

# Disable beep sound
unsetopt beep

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Locales
export LC_ALL=en_US.UTF-8

# Custom theme
# ZSH_THEME="my-theme"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins+=(
	command-not-found
	jsontools
        zsh_reload
    )
source $ZSH/oh-my-zsh.sh


# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Starship Prompt
eval "$(starship init zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm

# For pyenv
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# For psycopg2
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Java
# eval "$(jenv init -)"
if ! type jenv > /dev/null && [ -f "${JENV_ROOT}/bin/jenv" ]; then
    export PATH="${JENV_ROOT}/bin:${PATH}"
fi

# Lazy load jenv
if type jenv > /dev/null; then
    function jenv() {
        unset -f jenv
        eval "$(command jenv init -)"
        jenv $@
    }
fi
