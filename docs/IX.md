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
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/bin_ix
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/bin_ix/assemble
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/bin_ix/python
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/bin_ix/bsdtar
/ix/store/0Q4rkMy8J8D1WTVn-rlm-system/bin/bin_ix/curl
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
