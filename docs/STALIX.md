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

-- Login shell

No https://askubuntu.com/questions/866161/setting-path-variable-in-etc-environment-vs-profile

Every user session must start from the login shell, even in ssh daemon.

https://github.com/pg83/ix/blob/main/pkgs/bin/dropbear/ix.sh#L7 - patch from dropbear to launch all processes, including non-interactive ones, with login shell.
