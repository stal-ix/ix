Prereq:
 * [FS.md](FS.md)

IX package manager может быть использован как standalone, в любой поддерживаемой OS, так и как базовый package manager в дистрибутиве Linux stal/IX.

Этот документ описывает использование IX в составе stal/IX.

Инструкцию по установке stal/IX на диск вы можете прочитать в [INSTALL.md](INSTALL.md)

Базовые понятия:

Пакет - это содержимое одной папки в директории /ix/store.

Вот, например, содержимое пакета bzip2:

```
ix# find /ix/store/0GsKotnAh74LIcvO-bin-bzip2/
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzip2
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bunzip2
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzcat
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzip2recover
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzgrep
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzegrep
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzfgrep
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzmore
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzless
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzdiff
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/bin/bzcmp
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/env
/ix/store/0GsKotnAh74LIcvO-bin-bzip2/touch
```

Все пакеты образуют content addressable store, существенно похожее на такую же структуру в nixos и guix.

Realm - это тоже пакет, он содержит в себе символические ссылки на другие пакеты:

```
ix# find /ix/store/0Q4rkMy8J8D1WTVn-rlm-system
...
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/runit
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/runit-init
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/runsvchdir
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/utmpset
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/iwctl
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/iwd
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/sud_client
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/sud_server
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/doas
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/sudo
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/setcwd
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/mdevd
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/mdevd-coldplug
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/meta.json
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/env
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/touch
```

На некоторые realm есть якорные ссылки, которые помечают текущую(используемую) версию какого-то realm:

```
ix# ls -la /ix/realm/
total 0
drwxrwxrwx .
drwxr-xr-x ..
lrwxrwxrwx boot -> /ix/store/RCa2L8DHZs71ArSI-rlm-boot
lrwxrwxrwx kernel -> /ix/store/m3K7uWjZLVDshLNq-rlm-kernel
lrwxrwxrwx pg -> /ix/store/QC6vXQZNfLfhT4t1-rlm-pg
lrwxrwxrwx system -> /ix/store/PIYCjYiLy1AIxVVl-rlm-system
```

Для того, чтобы использовать содержимое какого-то realm, его нужно просто добавить в свой PATH:

```
ix# export PATH="/ix/realm/boot/bin:${PATH}"
```

Чтобы эта настройка случилась автоматически, первой строкой вашего сессионного скрипта сделайте:

```
. /etc/session
```

Для того, чтобы начать пользоваться IX, его нужно склонировать с github.

```
ix# git clone git@github.com:pg83/ix.git
ix# export PATH=${PWD}/ix:${PATH}
```

Любой пользователь с настроенным sudo может устанавливать пакеты в систему. Благодаря использованию content addressable store, разные версии пакетов не будут пересекаться друг с другом. Разные пользователи могут использовать разные версии репозитория IX. Рекомендованный способ настройки системы под себя - клонирование репозитория на github, и внесение нужных изменений в свой бранч. Возможно, когда-нибудь случится поддержка оверлеев.

Основная команда при использовании IX - это `ix mut`.

Установим в realm gui программу sway:

```
ix# ix mut gui bin/sway
```

Установим в realm gui программу sway, указав, что она должна использовать 3d ускоренный драйвер для AMD GPU:

```
ix# ix mut gui bin/sway --mesa_driver=radv
```

Так же [смотрите](ACCEL.md) для более детального ознакомления с темой 3D ускорения в stal/IX.

Скажем, что все программы в realm gui должны использовать AMD GPU:

```
ix# ix mut gui --mesa_driver=radv
```

Добавим браузер в realm gui:

```
ix# ix mut gui bin/epiphany
```

Нам надоел sway, и мы хотим использовать wayfire:

```
ix# ix mut gui -bin/sway bin/wayfire
```

Обновляем все установленные программы в gui realm:

```
ix# ix mut gui
```

Кстати, для того, чтобы манипулировать вашим именным realm, можно просто опустить его название из ix cli:

```
ix# ix mut bin/telegram/desktop
ix# ix mut -bin/epiphany +bin/links
```

Команда может одновременно манипулировать любым количеством realm. Неоднозначность разрешается благодаря тому, что названия realm не могут содержать /, а названия пакетов всегда его содержат:

```
ix# ix mut gui +bin/dosbox -bin/qemu tui +bin/links
```

Флаги, которые вы указываете через --, применяются к realm, если до этого не было указано пакета в рамках этого realm, и к пакету иначе:

```
ix# ix mut --mesa_driver=radv +bin/sway --mesa_driver=iris
```

Этой командой мы сказали, что в пользовательский realm нужно добавить флаг для использования AMD GPU, но вот sway мы хотим использовать с Intel GPU.

Важно! В рамках одной команды все изменения одного realm случаются атомарно, но якорные указатели на сами realm могут случиться в любом порядке.

Упражнение.

Объясните себе, что делает следующие команды:

```
ix# ix mut A bin/P --X=Y bin/P --X=Z -bin/P
```

```
ix# ix mut A -bin/P B +bin/P C +bin/P --X=Y
```

`ix let`

Эта команда делает все то же самое, что и `ix mut`, но не переключает якорную ссылку. Команда полезна, чтобы проинспектировать содержимое получившегося realm перед переключением.

`ix build`

Это `ix let` поверх временного(эфемерного) realm. Команда полезна для ознакомления с тем, как будет выглядеть какой-то набор пакетов(возможно один) в свежесозданном realm, без флагов и прочего окружения.

`ix gc`

Команда находит все неиспользуемые пакеты в /ix/store/, и переносит их в папку /ix/trash/, для асинхронного удаления. Пакет считается неиспользуемым, если до него нет пути от якорных realm в /ix/realm/.

`ix list`

Посмотреть список всех realm, или установленных пакетов(с флагами) в определенном realm.

Список всех доступных пакетов можно посмотреть в https://github.com/pg83/ix/tree/main/pkgs, или в папке pkgs/ в вашем клоне основного репозитория.
