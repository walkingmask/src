# mp3play
Play mp3 music file using afplay command.


## Usage
```
mp3play [-h] [-l] [-s] [-f FAVORITE] [-e EXCLUDE] [target]
```

`target` means path to mp3 file, or path to directory that contains mp3 files.


## Options
```
-h, --help          Show usage
-l, --loop          Loop play
-s, --shuffle       Shuffle playlist
-r, --random        Alias of --shuffle
-f, --favorite      Overwrite the favorite path
-f, --exclude       Overwrite the exclude word
```

### Favorite
You can register your favorite target with --favorite. And if this command is executed with no arguments, favorite is specified for target.

### Exclude
You can register the exclude word you want with --exclude. And If exclude word registerd, mp3 which word is included in the path will not play.


## Controll
```
^C        Skip a mp3
^C^C      Stop the command
```


## Installing
```
cd mp3play
bash install.sh
echo 'export PATH=$PATH:$HOME/bin' >>~/.zshrc
```


## Uninstalling
```
cd mp3play
sh uninstall.sh
```
