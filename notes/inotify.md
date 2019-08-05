# Increate inotify watches limit

Display current limit with `cat /proc/sys/fs/inotify/max_user_watches`

Create and edit a file `/etc/sysctl.d/99-inotify.conf`

Add this content to file:
```
fs.inotify.max_user_watches = 524288
```

Then run:

`sudo sysctl -p --system`

or

`sudo systemctl restart systemd-sysctl.service`
