# MyLogcat

Catch boot log and save it to /data/local/boot/boot-$time.log.This module can help you to save boot and app crash log. It will autostop after device has been completely booted for 30 seconds. Working with [busybox-ndk](https://github.com/Magisk-Modules-Repo/busybox-ndk) module is recomended.

## Command (in Terminal):

```
logc <second>
```

It will save the operation log in ${second}s to /data/local/logcat/logcat-$time-${second}s.log.

