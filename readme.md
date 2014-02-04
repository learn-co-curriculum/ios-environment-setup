# Bash Profile

As you've been learning, your bash_profile is a script that runs every time you open or login to your shell. It can configure environment variables, like your `PS1`, which stores your prompt, or `EDITOR`, which is the command other programs will use when they need to launch your default editor.

You can also create aliases for common commands so that they are shorter to use.

And finally, you can also build functions so simplify common workflows.

[Flatiron Bash Profile](https://github.com/flatiron-school/dotfiles/blob/master/bash_profile)

Within that Bash Profile are comments that explain each part. Make sure to read them! You can always comment sections in/out to see what they do and how they effect your prompt, shell, and environment. To create this bash_profile locally, simply navigate into your home directory (`cd ~`) and `touch .bash_profile` or if it exists already (`ls -a` and scan the output to see if there is a file .bash_profile - `open .bash_profile`). Copy the raw text from the Flatiron Bash Profile into your bash_profile and save.

Just remember, to activate a change in the dotfile, you must **reload your shell**. You can do that via opening a new tab or by typing `source ~/.bash_profile`. The `source` command basically will load a bash script (which your profile is coded in) into the current shell.

# GCC

Most OS level programs are written in C or C++. These programs must be compiled and interpreted by a C-level compiler. The most common compiler for POSIX systems is GCC, or the GNU Compiler Collection. On OS 10.8 and below (anything before Mavericks), we install GCC via XCode. Download XCode from the Mac App store. Once Xcode is installed, open it, then in the menu bar click on Xcode > preferences, then select Downloads. Download the command line tools. 

If you are using using OS 10.9(Mavericks) or above, you need to download the command line tools from Apples [developer webiste](https://developer.apple.com/downloads), or if you don't have an Apple developer account, you can download the command line tools [here](http://flatiron-school.s3.amazonaws.com/software/command_line_tools_os_x_mavericks_for_xcode__late_october_2013.dmg).

Once GCC is installed correctly, you should be able to type `gcc` into terminal and see output like:

```
clang: error: no input files
```

If you see output like:

```
-bash: gcc: command not found
```

The command line tools are not set up correctly.

[Creator of XCode Command Line Tools on Installing GCC](https://medium.com/kr-projects/6e54e8c50dc8)

[Download XCode Command Line Tools from Apple](https://developer.apple.com/downloads/index.action) *search for Command Line Tools*

Mount the downloaded DMG and install. Open a new terminal and try `gcc`.

# Homebrew

Once GCC is installed the next step is to install [Homebrew](http://mxcl.github.io/homebrew/). Homebrew will be our package manager, the system we use to install OS / Command Line level applications.

After, make sure to run brew doctor and try to resolve as many of the conflicts as possible.

Try `brew search postgres` and you'll find the postgres package (don't install it, we'll do that later.)

## Reinstalling Homebrew

Should you need this works:

```
\curl -L https://gist.github.com/mxcl/1173223/raw/a833ba44e7be8428d877e58640720ff43c59dbad/uninstall_homebrew.sh | bash
```
### Totally Ok brew doctor warnings

There are a couple of pretty benign brew doctor methods.

#### Warning: You have unlinked kegs in your Cellar

This is generally fine. If you want to fix them, just do brew link UNLINKEDKEGNAMES --force

#### Warning: Some keg-only formula are linked into the Cellar.

Totally fine, don't even stress this one.

# Git & SQLite3 Updates via Brew

OS X might ship with an old and broken version of git. We want to update it. Try `git version`. Then do `brew install git`. Open a new terminal tab and do `git version` to see if the version was bumped. If it wasn't, try `which git` to see where your command is running from (most likely is `/usr/bin`). The proper way around this is figuring out why `/usr/bin` is appearing first in your `PATH`. Sometimes `brew link git` helps fix that. If not a quick hack is to:

```
sudo mv /usr/bin/git /usr/bin/git.bak
```

That effectively will rename git in `/usr/bin` to a `git.bak` thereby preventing the lookup collision confusion.

The exact same instructions apply to sqlite3. For sqlite3 though you must also do `brew link sqlite3 --force` to create the symlink.

# RVM

Next comes setting up our ruby version manager. OS X ships with an old version of ruby and we want to seamlessly be able to move between versions. First, watch this short [screencast on RVM - 8 minutes](http://screencasts.org/episodes/how-to-use-rvm), read about it on [RVM](http://rvm.io) and then install rvm with:

```
\curl -L https://get.rvm.io | bash -s stable --ruby=2.0.0
```

That will install the latest stable version of RVM along with the latest stable version of ruby 2.0.0. Then type `rvm use 2.0.0 --default` to make that your default ruby. Open a new tab and try ruby -v and see if it matches the installed version of ruby. You can install new version of ruby with `rvm install 2.1.0` and see all installable rubies with `rvm list known`

## Troubleshooting RVM

There are two main sources of problems with RVM. Most occur during the installing of Ruby portion. You might get errors regarding XCode or GCC and that generally means you need to [uninstall XCode - read the entire guide, follow all instructions](http://osxdaily.com/2012/02/20/uninstall-xcode/) and then restart your computer. Reinstall an up to date version of Xcode or the command line tools if you are on Mavericks and then try to install ruby again.

Other issues have to do with broken homebrew installations. Try reinstalling homebrew with:

```
\curl -L https://gist.github.com/mxcl/1173223/raw/a833ba44e7be8428d877e58640720ff43c59dbad/uninstall_homebrew.sh | bash
```

If ruby installed correctly but `ruby -v` still outputs the 1.8.7 OSX version, do `which ruby` (after opening a new tab and trying again) to confirm it is being run out of `/usr/bin/ruby`. If so, there is a `PATH` issue which should be fixed, but you can also do this hack:

```
sudo mv /usr/bin/ruby /usr/bin/ruby.bak
sudo mv /usr/bin/gem /usr/bin/gem.bak
```

### Uninstalling RVM Because of Sys Wide Installs

Another issue is sometimes rvm gets installed in /usr/local/rvm, a system wide install. If so, you have to rvm implode to uninstall rvm, clear out your .bashrc file or remove any reference to RVM in there, `sudo rm /etc/profile.d/rvm.sh`.  You'll also want to remove the reference to that file you just deleted in the `/etc/profile`. Also `sudo rm /etc/rvmrc`. And then restart your computer and reinstall rvm. Make sure it is installing into `/Users/yourusername/.rvm` and not `/usr/local` A system wide install in /usr/local/rvm, never install rvm with sudo (and avoiding the use of sudo in general).
Finally ensure that 1.9.3 is the default ruby with `rvm use 1.9.3 --default`

# Check Up

## gcc

Typing `gcc` should give you something like:

```
clang: error: no input files
```

Not command not found.

## brew

`brew doctor` should reveal no errors. If it tells you that you have macports installed, uninstall it. Other warnings are generally benign at this point.

## terminal

Make sure when you open a new terminal your output looks something like:

```
Last login: Tue Jun  4 22:43:49 on ttys006
[22:44:08] ~
♥
```

If you see some `bash - command not found` type output, it's not a big deal, but let a TA know.

## ruby

`ruby -v` should give you a modern, rvm based ruby, like 2.0.0. `which ruby` should point to an rvm path. Opening a new terminal should maintain ruby versions, if not try `rvm use 2.0.0 --default`

## rvm

`rvm list` should show you installed ruby versions, like 2.0.0.

## sqlite3

`sqlite3 --version` should be >= the 3.7.12 series. If not, do `brew install sqlite3 and `brew link sqlite3 --force` and open a new terminal to retest.

## git

`git --version` should be above 1.8.5. `which git` should point to `/usr/local/bin/git`. If not `brew install git` and `brew link git --force`, new terminal, retest.

## rubygems

`gem env` should output consistent information about your gem env, pointing to similar RVM based paths. Like:

```
RubyGems Environment:
  - RUBYGEMS VERSION: 2.2.1
  - RUBY VERSION: 2.0.0 (2013-06-27 patchlevel 247) [x86_64-darwin13.0.0]
  - INSTALLATION DIRECTORY: /Users/arelenglish/.rvm/gems/ruby-2.0.0-p247
  - RUBY EXECUTABLE: /Users/arelenglish/.rvm/rubies/ruby-2.0.0-p247/bin/ruby
  - EXECUTABLE DIRECTORY: /Users/arelenglish/.rvm/gems/ruby-2.0.0-p247/bin
  - SPEC CACHE DIRECTORY: /Users/arelenglish/.gem/specs
  - RUBYGEMS PLATFORMS:
    - ruby
    - x86_64-darwin-13
  - GEM PATHS:
     - /Users/arelenglish/.rvm/gems/ruby-2.0.0-p247
     - /Users/arelenglish/.rvm/gems/ruby-2.0.0-p247@global
  - GEM CONFIGURATION:
     - :update_sources => true
     - :verbose => true
     - :backtrace => false
     - :bulk_threshold => 1000
  - REMOTE SOURCES:
     - https://rubygems.org/
```

Notice how all the ruby versions correspond in both number and paths?

# BASH Extras

## Case-Insensitive Auto-Completion

[Installing Case Insensitive Tab Autocompletion](http://superuser.com/questions/90196/case-insensitive-tab-completion-in-bash)

# Git Updates

## git branch autocompletion

Autocompletion (pressing tab to autocomplete the name of something) is amazing. You can autocomplete your git branch names through homebrew very easily. Just run:

```
brew install bash-completion
```

Make sure your `.bash_profile` has this somewhere:

```
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

## gitconfig

Grab the [Flatiron GitConfig](https://github.com/flatiron-school/dotfiles/blob/master/gitconfig) and create it as `.gitconfig` in your `~`. Also, don't forget to replace the values in some of the person variables like `excludesfile = /Users/<YOUR HOME DIRECTORY>/.gitignore` and:

Pay attention to the cool aliases setup in the git config, like git co for git checkout and git st for git status.

```
[github]
  user = <github username>
  token = <API token> # https://github.com/settings/applications
  email = <github email address>
```

## gitignore

Read [Github GitIgnore Guide](https://help.github.com/articles/ignoring-files), so you understand what a global gitignore will do and then grab the [Flatiron GitIgnore](https://github.com/flatiron-school/dotfiles/blob/master/gitignore) and create it in `~` as `.gitignore`.

## gemrc

`gem: --no-ri --no-rdoc`
This will omit installing the rdoc documentation and speed up gem installs.

## irbrc

```ruby
class Object

  def lm
    (self.methods - Object.methods).sort
  end

  def lim
    (self.instance_methods - Object.instance_methods).sort
  end

end

```
This will allow you to see what methods an object you're working with has but excluding the stuff that exists on all ruby objects.

##base/sqlitebrowser/navicat

Base is an OS X GUI for browsing SQL databases but is not free.
SQLitebrowser is a GUI that only works for SQLITE.
Navicat is a free GUI that works for multiple database types (SQLITE, MYSQL, POSTGRES)