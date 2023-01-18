# Installation 

> Prereq:<br>
> [IX.md](IX.md)<br>
> [FS.md](FS.md)<br>


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

For general instructions about disk partitioning please refer to<br>
https://wiki.archlinux.org/title/installation_guide#Partition_the_disks.<br>

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

Fetch **IX** package manager, will be used later, from ix user before reboot, and by root user, after reboot:

```
# we do not want to change our CWD
(cd home/root; git clone https://github.com/pg83/ix.git)
```

Add symlink, to trick **IX** package manager:

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

And run **IX** package manager, to populate our rootfs with bootstrap tools!

```
cd home/root/ix
export IX_ROOT=/ix
export IX_EXEC_KIND=local
./ix mut system set/stalix --failsafe --mingetty etc/zram/0
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

Rebuild world, again. And [add a whole new user, without sudo capability](https://github.com/pg83/ix/blob/main/docs/ETC.md#:~:text=Add%20a%20whole%20new%20user%2C%20without%20sudo%20capability%3A)<br>

Now try login from tty1
