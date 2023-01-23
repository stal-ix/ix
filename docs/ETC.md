# etc

> Prereq:<br>
> [FS.md](FS.md)<br>
> [IX.md](IX.md)


/etc in **stal/IX** is a symbolic link to etc/ from the system realm:

```shell
ix# ls -la /etc
lrwxrwxrwx ... /etc -> /ix/realm/system/etc
```

Files in the IX store are read only, they can't be changed. Therefore, the only way to make a setting in the installed OS **stal/IX**, is to add some package that contains the needed setting to the system realm.<br>

Most of these packages are etc/ prefixed and are located in https://github.com/pg83/ix/tree/main/pkgs/etc<br>

## Examples

Add a whole new user, without sudo capability:

```shell
# cryptpw will read password from command line
root# ix mut system etc/user/0 --user={{username}} --hash=$(cryptpw)
# shell will relaunch thereafter
mkdir /home/{{username}}
chown {{username}} /home/{{username}}
```

It's important to note that, after almost any change to the system realm, runit will restart the entire process tree. Effectively, this will result in you being kicked into your login manager (emptty/mingetty/etc).

## Activate zram0

```shell
ix# ix mut system etc/zram/0
```

## Remove the root console from tty5 that we added during installation

```shell
ix# ix mut system --failsafe=-
```

## Replace mingetty with emptty as login manager

*ProTip:* First try looking at https://github.com/pg83/ix/blob/main/pkgs/set/stalix/unwrap/ix.sh#L17, and come up with what the next command might look like!<br>

*Warning:* if you don't have ~/.emptty configured, and don't have a failsafe console on tty5, then you may need a recovery.

```shell
ix# ix mut system --mingetty=- --emptty
```

## Timezone settings
The system uses UTC time by default. There is currently no global timezone setting, each user must set their own timezone in their session script:

```shell
export TZ=Europe/Moscow
```
