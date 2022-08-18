sudo sh
mkdir /mnt/ix
yum install parted || apt-get install parted
# prepare xfs on /dev/xxx, with parted
mount /dev/xxx /mnt/ix
mkdir /mnt/ix/ix
useradd -u 1000 ix
chown ix /mnt/ix/ix
ln -s /mnt/ix/ix /ix
cd /mnt/ix
ln -s ix/realm/system/bin bin
ln -s ix/realm/system/etc etc
mkdir -p home/root var sys proc dev
cd home/root
git clone https://github.com/pg83/ix.git
su ix
cd ix
export IX_ROOT=/ix
export IX_EXEC_KIND=local
./ix mut system set/system/0 --failsafe=1 etc/zram/0
./ix mut root set/install
./ix mut boot set/boot bld/all
# somehow prepare kernel, and copy it to /mnt/ix/boot
# useful config options one can grab from bin/kernel/19/2/cfg
# reboot into grub, run
> linux (hdX,gptY)/boot/kernel ro root=/dev/xxx
> boot
# after successful boot, switch into tty5, there will be root prompt
. /etc/session
# now wehave some useful utilities in PATH, from /ix/realm/root
cd
cd ix
# very important step, rebuild system realm
./ix mut system
# shell will relaunch thereafter
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
#1/usr/bin/env sh
. /etc/session
exec /bin/sh -li
EOF
chmod +x .emptty
# now try login from tty1
