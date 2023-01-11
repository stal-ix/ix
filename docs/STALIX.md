Stal/IX - это не UNIX, и не Linux, в привычном смысле этих терминов.

Stal/IX - попытка переосмыслить какие-то основы, не трогая API и ABI Linux.

Этот документ содержит регулярно пополняемый список отличий Stal/IX от conventional Linux.

-- No https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard

https://github.com/pg83/ix/blob/main/docs/FS.md

В целом, файловая система будет привычна тем, кто знаком с Nix/Guix

-- Non-root package management

https://github.com/pg83/ix/blob/main/docs/IX.md

Все файлы в системе принадлежат пользователю ix, и все управление пакетами ведется от его имени.

Следствие - в системе нет ни одного suid binary. sudo - thin layer over local ssh daemon, for priviledge escalation.

-- Fully supervised process tree

У каждого процесса, отличного от init, есть parent, отличный от init. Все процессы, которые не удовлетворяют этому требованию, убиваются специально выделенным фоновым процессом. Для управления сервисами используется runit, поощряющий такое поведение.

https://github.com/swaywm/sway/issues/6828
https://github.com/pg83/ix/blob/main/pkgs/bin/sched/staleprocs/staleprocs.sh

-- Static linking

No ld.so!

-- Login shell

No https://askubuntu.com/questions/866161/setting-path-variable-in-etc-environment-vs-profile

Every user session must start from login shell, even in ssh daemon.

https://github.com/pg83/ix/blob/main/pkgs/bin/dropbear/ix.sh#L7 - patch from dropbear, для запуска всех процессов, в том числе, non interactive, с login shell.
