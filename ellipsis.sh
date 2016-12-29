#!/usr/bin/env bash
#
# shinzui/dot-home ellipsis package

pkg.link() {
  readonly files=(gemrc pryrc psqlrc)

  for file in "${files[@]}"; do
    fs.link_file "$file"
  done
}

pkg.install() {

  if [ "$(os.platform)" = 'osx' ]; then
    install_brew_packages

    copy_fonts
  fi

}

install_brew_packages() {
  brew update
  brew install fasd shellcheck fzf jq zsh bash bash-completion exiftool ssh-copy-id the_silver_searcher tmux imagemagick git git-extras \
    reattach-to-user-namespace shellcheck md5sha1sum

  #install fzf's shell extensions
  /usr/local/opt/fzf/install

  brew install postgresql rethinkdb redis ruby-build node nsq
}

copy_fonts() {
  cp "$PKG_PATH/fonts/Menlo-for-Powerline/"*.ttf ~/Library/Fonts/
}

# pkg.push() {
#     git.push
# }

# pkg.pull() {
#     git.pull
# }

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }
