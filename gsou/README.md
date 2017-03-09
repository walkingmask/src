gsou
======================
Generate source code template.

Examples
------
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

Options
------
```
-c    Clang
-java Java
-pl   Perl
-py   Python
-sh   ShellScript
```

Requirements
------
- Sublime Text 3

Installing
------
```
cd gsou
bash install.sh
echo 'export PATH=$PATH:$HOME/bin' >>~/.zshrc
```

Uninstalling
------
```
cd gsou
sh uninstall.sh
```
