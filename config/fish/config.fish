# Variables

set -x ARCHFLAGS "-arch x86_64"
set -x EDITOR "nvim"
set -x PSQL_EDITOR 'nvim +"set syntax=sql" '
set -x RIPGREP_CONFIG_PATH "$HOME/.dotfiles/ripgreprc"
set -x CPPFLAGS "$CPPFLAGS -I/usr/local/opt/openssl/include"
set -x LDFLAGS "$LDFLAGS -L/usr/local/opt/openssl/lib"
# set -x CPPFLAGS "$CPPFLAGS -I$HOME/.rubies/ruby-2.3.5/include"
# set -x LDFLAGS "$LDFLAGS -L$HOME/.rubies/ruby-2.3.5/lib"
set -x CPPFLAGS "$CPPFLAGS -I/usr/local/opt/readline/include"
set -x LDFLAGS "$LDFLAGS -L/usr/local/opt/readline/lib"
set -x LDFLAGS "$LDFLAGS -L/usr/local/opt/libffi/lib"
set -x CPPFLAGS "$LDFLAGS -L/usr/local/opt/libffi/include"
set -x CPPFLAGS "$CPPFLAGS -I/usr/local/opt/imagemagick@6/include"
set -x LDFLAGS "$LDFLAGS -L/usr/local/opt/imagemagick@6/lib"
set -g CPPFLAGS "$CPPFLAGS -I/usr/local/opt/libpq/include"
set -g LDFLAGS "$LDFLAGS -L/usr/local/opt/libpq/lib"
set -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"
set -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/usr/local/opt/readline/lib/pkgconfig"
set -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/usr/local/opt/libpq/lib/pkgconfig"
set -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig"
set -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/usr/local/opt/libffi/lib/pkgconfig"
set -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/usr/local/opt/imagemagick@6/lib/pkgconfig"
set -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/usr/local/opt/libpq/lib/pkgconfig"
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PATH:/usr/local/opt/openssl/bin"
set -x PATH "$PATH:$HOME/Library/Android/sdk/platform-tools"
set -x PATH "$PATH:$HOME/Library/Android/sdk/build-tools"
set -x PATH "$PATH:$HOME/Library/Android/sdk/emulator"
set -x PATH "$PATH:$HOME/Library/Android/sdk/tools/bin"
set -x PATH "$PATH:$HOME/Library/Android/sdk/tools"
set -x PATH "$PATH:$PYENV_ROOT/bin"
set -x PATH "$PATH:/usr/local/opt/imagemagick@6/bin"
# set -gx ASDF_DIR "/usr/local/opt/asdf"

set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/icu4c/lib"
set -gx CPPFLAGS "-I/usr/local/opt/icu4c/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/icu4c/lib/pkgconfig"
set -gx JAVA_HOME (/usr/libexec/java_home)
set -gx HOMEBREW_NO_AUTO_UPDATE 1 # thx @koenvo

set -U fish_greeting ""

# # disabled, npm starts creating symlic links to home dir when using this :-(
# export XDG_CONFIG_HOME="~/.config"

# Aliases

alias vim='nvim'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias restart_postgres='rm /usr/local/var/postgres/postmaster.pid; brew services restart postgres'

# Abbreviations

abbr --add l ls -lash
abbr --add v vim
abbr --add v. vim .
abbr --add s subl
abbr --add s. subl .
abbr --add be bundle exec
abbr --add bef bundle exec foreman
abbr --add g git
abbr --add gs git status
# abbr --add gd git diff
abbr --add ga git add
abbr --add gc git commit -m
abbr --add c code

# Tools

# brew install autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# set -g fish_user_paths $fish_user_paths "/usr/local/opt/node@10/bin"
# set -gx LDFLAGS "$LDFLAGS -L/usr/local/opt/node@10/lib"
# set -gx CPPFLAGS "$CPPFLAGS -I/usr/local/opt/node@10/include"

# brew install direnv
if which direnv > /dev/null;
  eval (direnv hook fish)
end

# brew install chruby-fish
# [ -f /usr/local/share/chruby/chruby.fish ]; and source /usr/local/share/chruby/chruby.fish
# [ -f /usr/local/share/chruby/auto.fish ]; and source /usr/local/share/chruby/auto.fish

# python virtualenv switching
# brew install pyenv-virtualenv
# if which pyenv-virtualenv-init > /dev/null;
#   status --is-interactive; and source (pyenv init -|psub)
#   status --is-interactive; and source (pyenv virtualenv-init -|psub)
#
#   set -x WORKON_HOME ~/.envs
# end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

source ~/.asdf/asdf.fish

# fix bit completions
# https://github.com/chriswalz/bit/issues/3#issuecomment-707170078
set -Ux COMP_POINT 1
