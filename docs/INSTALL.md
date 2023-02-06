# Installation 

> Prereq:<br>
> [IX.md](IX.md)<br>
> [FS.md](FS.md)<br>


Load machine from some bootable media, like Ubuntu/Fedora/Nix livecd, launch terminal

```shell
sudo sh
```

Install tools:

```shell
test -f /usr/bin/parted || yum install parted || apt-get install parted
test -f /usr/bin/g++ || yum install g++ || apt-get install g++
test -f /usr/bin/git || yum install git || apt-get install git
```

For general instructions about disk partitioning please refer to<br>
https://wiki.archlinux.org/title/installation_guide#Partition_the_disks.<br>

Somehow prepare xfs on /dev/xxx, with parted, mkfs.xfs, and mount it:

```shell
mkdir /mnt/ix
mount /dev/xxx /mnt/ix
```

Prepare some symlinks, thus forming our future rootfs:

```shell
cd /mnt/ix

ln -s ix/realm/system/bin bin
ln -s ix/realm/system/etc etc
ln -s / usr

mkdir -p home/root var sys proc dev
```

Add symlink, to trick **IX** package manager:

```shell
ln -s /mnt/ix/ix /ix
```

Add user **ix**, which will own all packages in system(note: uid 1000 important):

```shell
useradd -u 1000 ix
```

Prepare managed dir, owned by user **ix**, in /ix, /ix/realm, etc:

```shell
mkdir ix
chown ix ix
```

Prepare **ix** user home, owned by **ix**:

```shell
mkdir home/ix
chown ix home/ix
```

Change user, from now on will run all commands under **ix** user:

```shell
su ix
cd /mnt/ix
```

Fetch **IX** package manager, will be used later, from **ix** user before reboot, and by **root** user, after reboot:

```shell
# we do not want to change our CWD
(cd home/ix; git clone https://github.com/stal-ix/ix.git)
```

Some quirks:

```shell
# TODO(pg83): describe
mkdir -m 0777 ix/realm
```

And run **IX** package manager, to populate our root fs with bootstrap tools!

```shell
cd home/ix/ix
export IX_ROOT=/ix
export IX_EXEC_KIND=local
./ix mut system set/stalix --failsafe --mingetty etc/zram/0
./ix mut root set/install
./ix mut boot set/boot/all
```

Now [prepare bootable kernel for your hardware](KERNEL.md). Reboot into grub, run:

```shell
> linux (hdX,gptY)/boot/kernel ro root=/dev/xxx
> boot
```

where X, Y - GRUB disk and partition numbers for /dev/xxx.
After successful boot, switch into tty5, there will be root prompt.

```shell
. /etc/session
```

Now we have some useful utilities in PATH, from /ix/realm/root.

```shell
cd /home/ix/ix
# very important step, rebuild system realm
./ix mut system
```

Shell will relaunch thereafter. Actually, after any modification of system realm, runit will reload all supervised process tree.

```shell
cd /home/ix/ix
./ix mut $(./ix list)
```

Rebuild world, again. And [add a whole new user, without sudo capability](https://github.com/stal-ix/ix/blob/main/docs/ETC.md#:~:text=Add%20a%20whole%20new%20user%2C%20without%20sudo%20capability%3A)<br>

Now try login from tty1
