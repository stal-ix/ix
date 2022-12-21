Prereq:
 * [FS.md](FS.md)

IX package manager can be used standalone on any supported OS, or as a base package manager on Linux stal/IX distribution.

This document describes the IX usage as part of stal/IX.

The stal/IX on disk installing guide you can read in [INSTALL.md](INSTALL.md)

Basic concepts:

Package - one folder contents in /ix/store directory.

Here, for example, is bzip2 package contents:

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

All packages form a content addressable store, substantially similar to the same structure in nixos and guix.

Realm - also a package, it contains symlinks to other packages:

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

Some realms have anchor links that mark the current (used) version of some realm:

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

To use the contents of some realm, just add this realm to your PATH:

```
ix# export PATH="/ix/realm/boot/bin:${PATH}"
```

To make this setting happen automatically, in the first line of your session script, do:

```
. /etc/session
```

To start using IX clone it from github.

```
ix# git clone git@github.com:pg83/ix.git
ix# export PATH=${PWD}/ix:${PATH}
```

Any user with sudo configured can install packages on the system. Thanks to the content addressable store usage, different versions of packages will not overlap with each other. Different users may use different IX repository versions. The recommended way to customize the system for yourself - clone the repository on github, and make the necessary changes to your branch. Perhaps, someday there'll be support for overlays.

The basic command when using IX is `ix mut`.

Install the sway program in realm gui:

```
ix# ix mut gui bin/sway
```

Install the sway program in realm gui, specifying that it should use the 3d accelerated driver for AMD GPU:

```
ix# ix mut gui bin/sway --mesa_driver=radv
```

[See](ACCEL.md) also for a more detailed introduction to the subject of 3D acceleration in stal/IX.

Let's say that all programs in realm gui should use AMD GPU:

```
ix# ix mut gui --mesa_driver=radv
```

And remove mesa_driver flag, for software 3D:

```
ix# ix mut system --mesa_driver=-
```

Add a browser to the realm gui:

```
ix# ix mut gui bin/epiphany
```

We are fed up with sway and want to use wayfire:

```
ix# ix mut gui -bin/sway bin/wayfire
```

Update all installed programs in the gui realm:

```
ix# ix mut gui
```

By the way, to manipulate your named realm, you can simply omit its name from ix cli:

```
ix# ix mut bin/telegram/desktop
ix# ix mut -bin/epiphany +bin/links
```

The command can manipulate any number of realms at the same time. The ambiguity is resolved by the fact that realm names cannot contain /, and package names always contain it:

```
ix# ix mut gui +bin/dosbox -bin/qemu tui +bin/links
```

Flags you specify with --, apply to the realm if no package was previously specified within that realm, otherwise to the package:

```
ix# ix mut --mesa_driver=radv +bin/sway --mesa_driver=iris
```

With this command, we said that we need to add a flag to the user realm for AMD GPU usage, but we want to use sway with Intel GPU.

Important! Within a single command, all changes to one realm happen atomically, but anchor pointers to the realm themselves can happen in any order.

Exercise.

Explain yourself what the following commands do:

```
ix# ix mut A bin/P --X=Y bin/P --X=Z -bin/P
```

```
ix# ix mut A -bin/P B +bin/P C +bin/P --X=Y
```

`ix let`

This command does everything the same as `ix mut`, but doesn't switch the anchor link. The command is useful to inspect the contents of the resulting realm before switching.

`ix build`

It's `ix let` over a temporary (ephemeral) realm. The command is useful for reviewing the way some set of packages (can be one) will look like in a freshly created realm, without flags and other environments.

`ix gc`

The command finds all unused packages in /ix/store/ and moves them to the /ix/trash/ folder for asynchronous removal. A package is considered unused if there is no path to it from anchor realms in /ix/realm/.

`ix list`

View a list of all realms, or installed packages (with flags) in a specific realm.

A list of all available packages can be found at https://github.com/pg83/ix/tree/main/pkgs, or in the pkgs/ folder in your clone of the main repository.

`ix mut $(ix list)`

This command is used for all realms updating.

There're a number of commands in IX that are made as standalone scripts and aren't part of the kernel. For example, because they are not implemented well enough in general, or their semantics aren't well developed enough. These commands are available through the `ix tool`:

`ix tool list` - show all available commands.

Search for the wanted package by name:

```
ix# ix tool listall | grep ssh
lib/ssh/2
lib/ssh
bin/openssh
bin/openssh/client
bin/openssh/d
bin/openssh/d/ix
bin/tinyssh
```

Show all packages that need to be updated (uses repology.org and fuzzy search):

```
ix# ix tool upver
libmpc 1.3.1
courier-mta 1.2.1
sh 3.6.0
mpv-git 20221218
klipper-estimator 3.1.0
vcpkg 2022.12.14
steamos-compositor-plus 1.10.6
clipboard 0.1.3
yambar 1.9.0
libdispatch 5.7.2
```
