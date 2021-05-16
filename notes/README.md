# notes

The util tool to help me write notes


## Usage

```
$ mkdir -p ~/notes/note
$ mkdir -p ~/notes/todo
$ cp ./__note__ ~/notes/note
$ cp ./__note__ ~/notes/todo
$ notes
input the path of your notes directory
> /Users/foo/notes
input target notes (comma separated, no space) (e.g. note,todo)
> note,todo
Save config to /Users/foo/.config/notes/config.sh
# note and todo will be open with Sublime Text
```


## Installi

```
cd notes
bash install.sh
echo 'export PATH=$PATH:$HOME/bin' >>~/.zshrc
```


## Uninstall

```
cd notes
sh uninstall.sh
```
