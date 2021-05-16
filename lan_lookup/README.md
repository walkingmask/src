# lan_lookup

Look up IP addresses and MAC addresses in LAN (192.168.0.x)


## Examples

```
$ lan_lookup
? (192.168.0.1) at 12:34:56:78:9a:bc on en0 ifscope [ethernet]
? (192.168.0.2) at ab:cd:ef:12:34:56 on en0 ifscope [ethernet]
? (192.168.0.3) at a1:b2:c3:d4:e5:f6 on en0 ifscope permanent [ethernet]
```


## Options

```
-2    Depth is 2 (means extend the look up range to 192.168.x.x)
```


## Install

```
cd lan_lookup
bash install.sh
echo 'export PATH=$PATH:$HOME/bin' >>~/.zshrc
```


## Uninstall

```
cd lan_lookup
sh uninstall.sh
```
