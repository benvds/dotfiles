# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE=true

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
alias bower="noglob bower"
alias vim='/opt/homebrew-cask/Caskroom/macvim/7.4-73/MacVim-snapshot-73/MacVim.app/Contents/MacOS/Vim'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

. ~/.dotfiles/z/z.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export ARCHFLAGS="-arch x86_64"

export EDITOR="mvim -f"

# vim als postgres default editor
export PSQL_EDITOR='vim +"set syntax=sql" '

# set vim as standard pager, e.g. for man pages
# export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

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

if [[ -e /usr/local/bin/archey ]]; then
  archey -c
fi

# node switching
[[ -s ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### QT 5
# export PATH=/usr/local/opt/qt5/bin:$PATH
# export LDFLAGS="-L/usr/local/opt/qt5/lib"
# export CPPFLAGS="-I/usr/local/opt/qt5/include"

### Oracle
# export DYLD_LIBRARY_PATH="/usr/local/oracle"
# export TNS_ADMIN="/usr/local/oracle/instantclient_11_2/admin"
# export SQLPATH="/usr/local/oracle"
# export ORACLE_HOME="/usr/local/oracle"
# export NLS_LANG="AMERICAN_AMERICA.UTF8"
# export PATH="$PATH:/usr/local/bin"
# export PATH="$PATH:/usr/local/oracle"
