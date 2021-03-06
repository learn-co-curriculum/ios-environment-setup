
## Setting up the subl symlink

The first task is to make a symlink to subl. This will allow you to type `subl` in your terminal to launch Sublime Text. Assuming you've placed Sublime Text 2 in the Applications folder, and that you have a `/usr/local/bin` directory in your path, you can run:

```
sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/bin/subl
```

You'll have to type in your user password.

Test it out by typing `subl`.

## Install Package Control

go to [this link](https://sublime.wbond.net/installation)

Sublime Text's functionality can be greatly expanded via plugins called "packages." We won't get into any specific ones to install here, but in order to install them later on down the road, we need to install what is known as Package Control.

Open Sublime Text (you should be able to type `subl` from your terminal now), and then either press:

```
ctrl+`
```

Or, click `View > Show Console`. This will open the Sublime Text console. Then, visit [this link](https://sublime.wbond.net/installation#st2), and copy and paste the code under the Sublime Text 2 tab into the Sublime Text console. Press `enter` and Package Control will be installed.
