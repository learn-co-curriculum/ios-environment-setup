#! /bin/bash
# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm";

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"

fi
rvm use system
sudo gem install bundler
cd /tmp
git clone https://github.com/flatiron-school-ironboard/xcpretty-flatiron.git
cd xcpretty-flatiron
bundle install
gem build xcpretty.gemspec
sudo gem install xcpretty-0.1.7.gem
cd ~
rvm use default
rm -Rf /tmp/xcpretty-flatiron
