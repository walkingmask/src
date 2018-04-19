# mp3play
Play mp3 music file using afplay command.


## Usage
```
mp3play [-r] [-l] mp3
```

`mp3` means path to mp3 file, or path to directory that contains mp3 files.


## Options
```
-r    Random play
-l    Loop play
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
