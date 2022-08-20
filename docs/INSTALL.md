Load machine from some bootable media, like Ubuntu/Fedora/Nix livecd, launch terminal

```
sudo sh
mkdir /mnt/ix
yum install parted || apt-get install parted
```

Somehow prepare xfs on /dev/xxx, with parted, and mount it:

```
mount /dev/xxx /mnt/ix
```

Prepare some symlinks, thus forming our future rootfs:

```
cd /mnt/ix

ln -s ix/realm/system/bin bin
ln -s ix/realm/system/etc etc
ln -s / usr

mkdir -p home/root home/ix var sys proc dev
```

Fetch ix package manager, will be used later, from ix user before reboot, and by root user, after reboot:

```
# we do not want to change our CWD
(cd home/root; git clone https://github.com/pg83/ix.git)
```

Add symlink, to trick ix package manager:

```
ln -s /mnt/ix/ix /ix
```

Add user ix, which will own all packages in system(note: uid 1000 important):

```
useradd -u 1000 ix
```

Prepare managed dir, owned by user ix, in /ix, /ix/realm, etc:

```
mkdir ix
chown ix ix
```

Change user, from now on will run all commands under ix user:

```
su ix
cd /mnt/ix
```

Some quirks(TODO(pg): describe):

```
mkdir -m 0777 ix/realm
```

And run ix package manager, to populate our rootfs with bootstrap tools!

```
cd home/root/ix
export IX_ROOT=/ix
export IX_EXEC_KIND=local
./ix mut system set/system/0 --failsafe=1 etc/zram/0
./ix mut root set/install
./ix mut boot set/boot/all
```

Somehow prepare kernel, and copy it to /mnt/ix/boot. Useful config options one can grab from bin/kernel/19/2/cfg. Reboot into grub, run

```
> linux (hdX,gptY)/boot/kernel ro root=/dev/xxx
> boot
```

where X, Y - GRUB disk and partition numbers for /dev/xxx.
After successful boot, switch into tty5, there will be root prompt.

```
. /etc/session
```

Now we have some useful utilities in PATH, from /ix/realm/root.

```
cd
cd ix
# very important step, rebuild system realm
./ix mut system
```

Shell will relaunch thereafter. Actually, after any modification of system realm, runit will reload all supervised process tree.

```
cd
cd ix
# very important step, rebuild all world from ix
./ix mut
# cryptpw will read password from command line
./ix mut system etc/user/0 --user=pg --hash=$(cryptpw)
# shell will relaunch thereafter
mkdir /home/pg
chown pg /home/pg
cd /home/pg
cat << EOF > .emptty
#!/usr/bin/env sh
. /etc/session
exec /bin/sh -li
EOF
chmod +x .emptty
# now try login from tty1
```
