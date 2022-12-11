Этот документ описывает устройство файловой системы stal/ix.

В /ix/store/ лежит набор папок, каждому пакету соответствует одна папка. Папки образуют content addressable store, то есть, все пути уникальным образом идентифицируют уникальный пакет.

```
pg-> ls -la /ix/store/ | head -n 10
total 340
drwxr-xr-x 5664 ix       1000        393216 Dec 11 16:46 .
drwxr-xr-x    6 ix       root            58 Nov  4 23:02 ..
drwxr-xr-x    4 ix       1000            56 Dec  7 01:17 00BoJm6qe56myzQk-lib-jxl
drwxr-xr-x    4 ix       1000            56 Dec  5 19:48 00OKaSNZ7iL7AJWm-lib-ssh-2
drwxr-xr-x    4 ix       1000            56 Dec  7 02:37 01JxssFZ9igzTy5i-lib-web-kit-gtk-orig
drwxr-xr-x    4 ix       1000            54 Dec  7 02:02 01S601SnGrScamy9-bin-xchm-unwrap
drwxr-xr-x    2 ix       1000            50 Dec  1 14:06 02P6wVvlRjp7YoRD-url-libxslt-v1-1-37-tar-bz2
drwxr-xr-x    3 ix       1000            41 Dec 11 04:10 02TsF9yb8tvNU18u-bin-p7zip-a
drwxr-xr-x    2 ix       1000            44 Dec  1 14:06 03xrH1zQOmgF5IBK-lnk
```

В папке /ix/realm/ лежат указатели на папки из /ix/store/.

```
pg-> ls -la /ix/realm/
total 0
drwxrwxrwx    2 ix       1000            56 Dec 11 16:46 .
drwxr-xr-x    6 ix       root            58 Nov  4 23:02 ..
lrwxrwxrwx    1 pg       10000           35 Dec 11 06:08 boot -> /ix/store/8V4bablsXQcSK6ZY-rlm-boot
lrwxrwxrwx    1 pg       10000           37 Dec 11 06:08 kernel -> /ix/store/GAw71z9yAtwOStPd-rlm-kernel
lrwxrwxrwx    1 pg       10000           33 Dec 11 16:46 pg -> /ix/store/w5qTNK0MpREVL4Cy-rlm-pg
lrwxrwxrwx    1 pg       10000           37 Dec 11 06:08 system -> /ix/store/oQfJCY3xa3jlPkNf-rlm-system
```

Фактически, это "корни", по которым ix package manager может понять, что из /ix/store/ активно используется, а что можно безопасно удалить, используя команду "ix gc".

Некоторые realm имеют заранее предопределенный смысл:

/ix/realm/system - это "системный" realm, в нем лежит код, необходимый для загрузки OS.

Корневые папки /etc, /bin смотрят на системный realm:

```
pg-> ls -la /bin /etc
lrwxrwxrwx    1 root     root            20 May 22  2022 /bin -> /ix/realm/system/bin
lrwxrwxrwx    1 root     root            20 May 22  2022 /etc -> /ix/realm/system/etc
```

Кстати, именно поэтому нет никакого смысла редактировать файлы в /etc, потому что они обновятся при любом обновлении /ix/realm/system

Для каждого пользователя в системе с именем {{USER}} есть realm /ix/realm/{{USER}}, который принадлежит этому пользователю:

* он является умолчанием при исполльзовании ix mut: "ix mut bin/nano" установит nano в ваш личный realm.
* он стоит первым в PATH:

```
pg-> echo ${PATH}
/ix/realm/pg/bin:/bin
```

Для того, чтобы это работало, ваш менеджер сессий должен сделать ". /etc/session"
