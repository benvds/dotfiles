ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"
export ZSH=/Users/benvds/.oh-my-zsh

# plugins=(git bundler osx rake ruby rust nvm npm node)
# plugins are slow
plugins=(git)

DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Aliases
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias mem_start="/usr/local/bin/memcached -d"
alias mem_stop="killall memcached"
alias be="bundle exec"
alias hk="heroku"
alias canary="open -a /Applications/Google\ Chrome\ Canary.app"
alias vim='/usr/local/bin/vim'
alias v='vim'
alias v.='vim .'
alias s='subl'
alias s.='subl .'
alias bef='bundle exec foreman'
alias gs='git status'

. ~/.dotfiles/z/z.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export ARCHFLAGS="-arch x86_64"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
export EDITOR="vim"

# vim als postgres default editor
export PSQL_EDITOR='vim +"set syntax=sql" '

# ruby switching
if [[ -e /usr/local/share/chruby ]]; then
  # Load chruby
  source '/usr/local/share/chruby/chruby.sh'

  # Automatically switch rubies
  source '/usr/local/share/chruby/auto.sh'

  # Set a default ruby if a .ruby-version file exists in the home dir
  if [[ -f ~/.ruby-version ]]; then
    chruby $(cat ~/.ruby-version)
  fi
fi

# node switching
# nvm is slow
# [[ -s ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh
alias loadnvm="[[ -s ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh"

# python virtualenv switching
# if which pyenv-virtualenv-init > /dev/null; then
#     eval "$(pyenv init -)";
#     eval "$(pyenv virtualenv-init -)";
# 
#     export WORKON_HOME=~/.envs
# fi
# source /usr/local/opt/autoenv/activate.sh

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

### Android
export PATH="$PATH:/Users/benvds/Library/Android/sdk/platform-tools:/Users/benvds/Library/Android/sdk/build-tools:/Users/benvds/Library/Android/sdk/tools"
export ANDROID_HOME="/Users/benvds/Library/Android/sdk"

### Add dotnet
# export PATH="/usr/local/share/dotnet:$PATH"

### Add Rust
# fpath+=~/.zfunc
# compinit
# source $HOME/.cargo/env
