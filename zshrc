ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"
export ZSH=/Users/benvds/.oh-my-zsh

# plugins are slow
plugins=(git)

# DISABLE_AUTO_UPDATE="true"
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

# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
  ## Solarized Light color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #"
}
_gen_fzf_default_opts

# if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
#   source /usr/local/opt/fzf/shell/key-bindings.zsh
#   source /usr/local/opt/fzf/shell/completion.zsh
# fi

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Aliases
alias vim='/Applications/MacVim.app/Contents/bin/vim'
alias v='vim'
alias v.='vim .'
alias s='subl'
alias s.='subl .'
alias be="bundle exec"
alias bef='bundle exec foreman'
alias g='git'
alias gs='git status'
alias ga='git add'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

. ~/.dotfiles/z/z.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export ARCHFLAGS="-arch x86_64"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
export EDITOR="vim"
# export VIMINIT=~/.config/init.vim
# # disabled, npm starts creating symlic links to home dir when using this :-(
# export XDG_CONFIG_HOME="~/.config"

# vim als postgres default editor
export PSQL_EDITOR='vim +"set syntax=sql" '

# # ruby switching
# if [[ -e /usr/local/share/chruby ]]; then
#   # Load chruby
#   source '/usr/local/share/chruby/chruby.sh'
#
#   # Automatically switch rubies
#   source '/usr/local/share/chruby/auto.sh'
#
#   # Set a default ruby if a .ruby-version file exists in the home dir
#   if [[ -f ~/.ruby-version ]]; then
#     chruby $(cat ~/.ruby-version)
#   fi
# fi

export RIPGREP_CONFIG_PATH="$HOME/.dotfiles/ripgreprc"

# # node switching
# # nvm is slow
# # [[ -s ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh
# export NVM_DIR="$HOME/.nvm"
# alias loadnvm="[[ -s /usr/local/opt/nvm/nvm.sh ]] && source /usr/local/opt/nvm/nvm.sh"

# python virtualenv switching
# brew install pyenv-virtualenv
# if which pyenv-virtualenv-init > /dev/null; then
#     eval "$(pyenv init -)";
#     eval "$(pyenv virtualenv-init -)";
#
#     export WORKON_HOME=~/.envs
# fi

# brew install autoenv
# if [ ! -f /usr/local/opt/autoenv/activate.sh ]; then
#     source /usr/local/opt/autoenv/activate.sh
# fi

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

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export CPPFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"

# export DISABLE_AUTO_TITLE="true"
#
# set-window-title() {
#   window_title="\e]1;$PWD\a"
#   echo -ne "$window_title"
# }
#
# PR_TITLEBAR=''
# set-window-title
# precmd set-window-title
