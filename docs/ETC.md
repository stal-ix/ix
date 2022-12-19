Prereq:
 * [FS.md](FS.md)
 * [IX.md](IX.md)

/etc в stal/IX является символической ссылкой на etc/ из системного realm:

```
ix# ls -la /etc
lrwxrwxrwx ... /etc -> /ix/realm/system/etc
```

Файлы в IX store read only, изменять их нельзя. Поэтому единственный способ внести настройку в установленный OS stal/IX - это добавить в системный realm какой-либо пакет, который содержит в себе нужную настройку. Большая часть такие пакетов имеет префикс etc/, и лежит в https://github.com/pg83/ix/tree/main/pkgs/etc

Примеры:

Add a whole new user, without sudo capability:

```
# cryptpw will read password from command line
root# ix mut system etc/user/0 --user={{username}} --hash=$(cryptpw)
# shell will relaunch thereafter
mkdir /home/{{username}}
chown {{username}} /home/{{username}}
```

Важно отметить, что, почти после любого изменения системного realm, runit перезапустит все дерево процессов. Эффективно это приведет к тому, что вас выкинет в ваш login manager (emptty/mingetty/etc)

Активировать zram0:

```
ix# ix mut system etc/zram/0
```

Удалить рутовую консоль с tty5, которую мы добавили во время установки:

```
ix# ix mut system --failsafe=-
```

Заменить mingetty на emptty в качестве login manager:

ProTip: Сначала попробуйте посмотреть https://github.com/pg83/ix/blob/main/pkgs/set/stalix/unwrap/ix.sh#L17, и придумать, как бы могла выглядеть следующая команда!
Warning: если у вас нет настроенного ~/.emptty, и нет failsafe консоли на tty5, то вам может понадобиться recovery.

```
ix# ix mut system --mingetty=- --emptty
```

По умолчанию, в системе используется UTC время. Настройки глобальной timezone в данный момент не предусмотрено, каждый пользователь должен выставить свою timezone в своем session script:

```
export TZ=Europe/Moscow
```
