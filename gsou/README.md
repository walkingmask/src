# gsou

Generate source code template.


## Examples

```
$ gsou -pl test
$ cat test.pl
#!/usr/bin/env perl

use strict;
use warnings;

# test.pl
# 2017/03/09(Thu)
# walkingmask

print("Hello, World!");

exit(0);
```


## Options

```
-c    Clang
-go   golang
-html HTML
-java Java
-pl   Perl
-py   Python
-sh   ShellScript
```


## Install

```
cd gsou
bash install.sh
echo 'export PATH=$PATH:$HOME/bin' >>~/.zshrc
```


## Uninstall

```
cd gsou
sh uninstall.sh
```
