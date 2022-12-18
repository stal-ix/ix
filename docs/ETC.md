Prereq:
 * (FS.md)[FS.md]
 * (IX.md)[IX.md]

/etc в stal/IX является символической ссылкой на etc/ из системного realm:

```
pg-> ls -la /etc
lrwxrwxrwx ... /etc -> /ix/realm/system/etc
```

Файлы в IX store read only, изменять их нельзя. Поэтому единственный способ внести настройку в установленный OS stal/IX - это добавить в системный realm какой-либо пакет, который содержит в себе нужную настройку. Большая часть такие пакетов имеет префикс etc/, и лежит в https://github.com/pg83/ix/tree/main/pkgs/etc

Примеры:

Add a whole new user, without sudo capability:

```
# cryptpw will read password from command line
./ix mut system etc/user/0 --user={{username}} --hash=$(cryptpw)
# shell will relaunch thereafter
mkdir /home/{{username}}
chown pg /home/{{username}}
```

Важно отметить, что, почти после любого изменения системного realm, runit перезапустит все дерево процессов. Эффективно это приведет к тому, что вас выкинет в ваш login manager (emptty/mingetty/etc)
