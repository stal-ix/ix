Stal/IX is not UNIX or Linux in the usual sense of these terms.

Stal/IX - an attempt to rethink some fundamentals without touching API and ABI Linux.

This document contains a regularly replenishing list of Stal/IX and conventional Linux differences.

-- No https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard

https://github.com/pg83/ix/blob/main/docs/FS.md

Overall, the file system will be familiar to those who know Nix/Guix.

-- Non-root package management

https://github.com/pg83/ix/blob/main/docs/IX.md

All files on the system are ix user-owned, and all package management is done on his behalf.

Consequence - there is not a single suid binary on the system. Sudo - the thin layer over local ssh daemon, for privilege escalation.

-- Fully supervised process tree

Every process different from init has a parent different from init. All processes that fail to meet this requirement are killed by a specially dedicated background process. To manage services used runit, encouraging this behavior.

https://github.com/swaywm/sway/issues/6828
https://github.com/pg83/ix/blob/main/pkgs/bin/sched/staleprocs/staleprocs.sh

-- Static linking

No ld.so!

https://gavinhoward.com/2021/10/static-linking-considered-harmful-considered-harmful/
https://lore.kernel.org/lkml/CAHk-=whs8QZf3YnifdLv57+FhBi5_WeNTG1B-suOES=RcUSmQg@mail.gmail.com/

-- Login shell

No https://askubuntu.com/questions/866161/setting-path-variable-in-etc-environment-vs-profile

Every user session must start from the login shell, even in ssh daemon.

https://github.com/pg83/ix/blob/main/pkgs/bin/dropbear/ix.sh#L7 - patch from dropbear to launch all processes, including non-interactive ones, with login shell.

-- Взаимодействие с upstream

Довольно часто upstream не интересуют идеи, заложенные в Stal/IX:

* https://bugzilla.gnome.org/show_bug.cgi?id=768215#c16 - разработчики glib активно мешают статической линковке с glib
* https://gitlab.gnome.org/GNOME/vte/-/issues/72 - разработчикам VTE нет дела до сборки с musl, и они не отвечают на вопросы - https://gitlab.gnome.org/GNOME/vte/-/issues/72#note_1415630
* https://wiki.musl-libc.org/faq.html - musl отказывается заводить макрос препроцессора для определения того, что код собирается с musl
* https://github.com/swaywm/sway/issues/6828 - sway не хочет вносить исправления для fully supervised process tree
* https://github.com/skarnet/execline/issues/9 - мы не можем использовать утилиты execline в наших стартовых скриптах, потому что их статическая сборка весит слишком много
* https://github.com/swaywm/sway/issues/4540 - зависание tty после смерти sway, и фикс, который не может войти в upstream - https://github.com/pg83/ix/blob/main/pkgs/bin/fixtty/main.c
* https://github.com/pg83/dlopen - fake dlopen, для проектов, которые не могут жить без загружаемых плагинов

Поэтому нам приходится поддерживать набор фиксов и исправлений для upstream, которые никогда не будут вмержены в upstream.

Цели проекта важнее, чем высокомерное поведение некоторых мейнтейнеров!
