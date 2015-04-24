---
tags: setup, environment, bash
languages: objc, bash
---

#Environment Setup

It's important to get your system setup and working well. There are a ton of different ways to customize your system, but to keep things simple, and to make it easy for others to work with you, we're going to set our computers up in a similar way. Go through the instructions in readme and the files in this repo and follow the instructions.

# ruby

BUT I THOUGHT THIS WAS IOS. While Objective-C is amazing for making iOS/OS X apps. A lot of the tools we use to create iOS apps (except XCode) is written in Ruby. So let's install ruby and tool to manage ruby called RVM. There is an AMAZING tutorial called [install Rails](http://installrails.com/steps/choose_os_version) that will walk you through everything. Stop once it gets into installing rails.

# Bash Profile

As you've been learning, your bash_profile is a script that runs every time you open or login to your shell. It can configure environment variables, like your `PS1`, which stores your prompt, or `EDITOR`, which is the command other programs will use when they need to launch your default editor.

You can also create aliases for common commands so that they are shorter to use.

And finally, you can also build functions to simplify common workflows.

[Flatiron Bash Profile](https://github.com/flatiron-school/dotfiles/blob/master/bash_profile)

Within that Bash Profile are comments that explain each part. Make sure to read them! You can always comment sections in/out to see what they do and how they effect your prompt, shell, and environment. To create this bash_profile locally, simply navigate into your home directory (`cd ~`) and `touch .bash_profile` or if it exists already (`ls -a` and scan the output to see if there is a file .bash_profile - `open .bash_profile`). Copy the raw text from the Flatiron Bash Profile into your bash_profile and save.

Just remember, to activate a change in the dotfile, you must **reload your shell**. You can do that via opening a new tab.

# CocoaPods

Cocoapods is a library management system. If you are on Mavericks you should be able to install by just doing:

```
gem install cocoapods
```

# SublimeText3

We spend most of our time in a text editor. Make sure you have a good one. We use [SublimeText3](http://www.sublimetext.com/3). Once you have that installed, go to the (sublime.md)[sublime.md] file in this repository and follow the instructions to get sublime setup properly.

# Test Learn submitter

First things first you need to edit/create a file called `.netrc` in your home (`~`) directory. So make the file (including the dot!) and put the following into it. You can get your github user id number [here](http://caius.github.io/github_id/)

```
machine flatiron-push
  login YOUR_GITHUB_NAME
  password YOUR_GITHUB_USER_ID_NUMBER
```

Second, in here there is a script called [installer.sh](https://raw.githubusercontent.com/learn-co-curriculum/ios-environment-setup/10feb4bad253b66cec2ea4e54735d6c856a422fc/installer.sh?token=1878855__eyJzY29wZSI6IlJhd0Jsb2I6ZmxhdGlyb24tc2Nob29sLWN1cnJpY3VsdW0vaW9zLWVudmlyb25tZW50LXNldHVwLzEwZmViNGJhZDI1M2I2NmNlYzJlYTRlNTQ3MzVkNmM4NTZhNDIyZmMvaW5zdGFsbGVyLnNoIiwiZXhwaXJlcyI6MTQxMjY5NjIyOX0%3D--28274d47fa2272952e382bc787c2e90aacd37f01). Go ahead and download it or if you cloned this repo it should be available to you. Run this script in a bit of a special way like this `/bin/bash --login ./installer.sh` replace `./installer.sh` with wherever the installer is located. It will ask for a password. Just type in your user password and everything should take care of itself!

# Check Up

## Terminal

Make sure when you open a new terminal your output looks something like:

```
Last login: Tue Jun  4 22:43:49 on ttys006
[22:44:08] ~
♥
```

If you see some `bash - command not found` type output, it's not a big deal, but let a TA know.

## CocoaPods

`pod --version` should give you a number. Hopefully `0.33.1`.

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

## .gitconfig

Grab the [Flatiron GitConfig](https://github.com/flatiron-school/dotfiles/blob/master/gitconfig) and create it as `.gitconfig` in your `~`. Also, don't forget to replace the values in some of the person variables like `excludesfile = /Users/<YOUR HOME DIRECTORY>/.gitignore` and:

Pay attention to the cool aliases setup in the git config, like git co for git checkout and git st for git status.

```
[github]
  user = <github username>
  token = <API token> # https://github.com/settings/applications
  email = <github email address>
```

## .gitignore

Read [Github GitIgnore Guide](https://help.github.com/articles/ignoring-files), so you understand what a global gitignore will do and then grab the [Flatiron GitIgnore](https://github.com/flatiron-school/dotfiles/blob/master/gitignore) and create it in `~` as `.gitignore`.

# What Next?

Check out the other documents in the repo! In particular make sure you have:

  * Setup Sublime
  * Set up a blog
