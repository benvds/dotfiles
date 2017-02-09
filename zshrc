
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
# alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
# alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias mem_start="/usr/local/bin/memcached -d"
alias mem_stop="killall memcached"
alias be="bundle exec"
alias hk="heroku"
alias canary="open -a /Applications/Google\ Chrome\ Canary.app"
alias vim='nvim'
alias v='vim'

. ~/.dotfiles/z/z.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export ARCHFLAGS="-arch x86_64"

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
[[ -s ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Android
# export PATH="$PATH:/Users/benvds/Library/Android/sdk/build-tools:/Users/benvds/Library/Android/sdk/tools"
