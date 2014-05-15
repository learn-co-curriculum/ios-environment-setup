Here's how Avi likes to setup directories for development. Some general rules he follows:

- Except for directories in `~`, always use lowercase directory names.
- I prefer `-` to `_` or ` ` to separate words in directory names.
- I want to keep all my code in one place.
- I want to have a place for resources and other things that are related to code, but aren't code.
- I want to be able to get in/out of different code projects easily.

So here's what my filesystem looks like, relevant to code only.

```
\Users\avi
  \Users\avi\Development
    \Users\avi\Development\books # for books and PDFs and Videos
    \Users\avi\Development\resources # for things like fonts or icons
    \Users\avi\Development\data # for raw SQL or Data Sources I use
    \Users\avi\Development\projects # for things that relate to large projects but aren't code
    \Users\avi\Development\code
      \Users\avi\Development\code\aviflombaum.github.io # Where that is a code project.
      \Users\avi\Development\code\flatiron\sql\homework1.sql # for a specific assignment in flatiron sql unit.
```

Then I make use of my `code` function in my `bash_profile` to quickly get into the main code directory where I can easily `cd` into whatever project or `ls | grep` a simple project.

If you want, add the following `lg` function to your bash profile for easy file matching in a current directory.

```
# A function to easily grep for a matching file
# USE: lg filename
function lg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ls -la | grep "[$FIRST]$REST"
}
```