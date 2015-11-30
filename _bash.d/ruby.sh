#!/bin/bash
export PATH="$PATH:$HOME/.gem/ruby/2.0.0/bin"
# rbenv
function install_rbenv() {
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/mislav/rbenv-user-gems.git ~/.rbenv/plugins/rbenv-user-gems
  git clone https://github.com/tpope/rbenv-readline.git   ~/.rbenv/plugins/rbenv-readline
  git clone https://github.com/rkh/rbenv-update.git       ~/.rbenv/plugins/rbenv-update
}
PATH=$PATH:~/.rbenv/bin
if which rbenv &> /dev/null; then
  eval "$(rbenv init -)"
  PROMPT_COMMAND="${PROMPT_COMMAND};rm -f /Users/k-omoto/.rbenv/shims/rubocop"
fi
