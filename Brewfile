# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
install wget --enable-iri

install ack
install apple-gcc42
install autoconf
install automake
install caskroom/cask/brew-cask
install chruby
install cmake
install ctags
install fasd
install git
install git-flow
install gnutls
install go
install imagemagick --with-webp
install libxml2
# install macvim # install with cask
install memcached
install mercurial
install node # This installs `npm` too using the recommended installation method
install ossp-uuid
install openssl
install p7zip
install python
install readline
install rename
install ruby-install
install the_silver_searcher
install tree
install v8
install valgrind

# Remove outdated versions from the cellar
cleanup
