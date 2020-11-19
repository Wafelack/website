I've been using Vim with pathogen for a while now, and I noticed that it is very long and very annoying to write, each time i wanted to install a plugin

```
git clone https://github.com/<user>/<repo> ~/.vim/bundle/<repo>
cd ~
git submodule add https://github.com/<user>/<repo> ~/.vim/bundle/<repo>
```

I could use another plugin manager like Vundle, but I wanted to have directly the repo cloned to make it easily updatable and to not to be dependent to an external system.

So, I decided to make that simple program to install and search easily for plugins.

It is written in Rust, and basically makes a call to github api to find a repo and uses git clone to download plugin, like you would do in command line.

I plan to add an update command, that would execute `git pull` in every plugin folder and to open for other git remotes.

Repository link, if you want to leave a star or just download it : [https://github.com/Wafelack/Vlugger](https://github.com/Wafelack/Vlugger)