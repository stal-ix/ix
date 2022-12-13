Prereq:
 * [IX.md](IX.md)
 * [FS.md](FS.md)

Load machine from some bootable media, like Ubuntu/Fedora/Nix livecd, launch terminal

```
sudo sh
```

Install tools:

```
test -f /usr/bin/parted || yum install parted || apt-get install parted
test -f /usr/bin/g++ || yum install g++ || apt-get install g++
test -f /usr/bin/git || yum install git || apt-get install git
```

For general instructions about disk partitioning please refer to https://wiki.archlinux.org/title/installation_guide#Partition_the_disks.
Somehow prepare xfs on /dev/xxx, with parted, mkfs.xfs, and mount it:

```
mkdir /mnt/ix
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
./ix mut system set/system/0 --failsafe --mingetty etc/zram/0
./ix mut root set/install
./ix mut boot set/boot/all
```

Now [prepare bootable kernel for your hardware](KERNEL.md). Reboot into grub, run:

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
cd /home/root/ix
# very important step, rebuild system realm
./ix mut system
```

Shell will relaunch thereafter. Actually, after any modification of system realm, runit will reload all supervised process tree.

```
cd /home/root/ix
./ix mut $(./ix list)
```

Rebuild world, again. And add a whole new user, without sudo capability:

```
# cryptpw will read password from command line
./ix mut system etc/user/0 --user=pg --hash=$(cryptpw)
# shell will relaunch thereafter
mkdir /home/pg
chown pg /home/pg
```

Now try login from tty1
