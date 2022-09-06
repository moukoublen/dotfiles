### For gui apps
In files 
  * `/etc/systemd/user.conf`
  * `/etc/systemd/system.conf`

Add line ` DefaultLimitNOFILE=65535`


### General
In file 
  * `/etc/security/limits.con`

Add lines 

```
* hard nofile 65535
* soft nofile 65535
```
