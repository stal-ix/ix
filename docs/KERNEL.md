# Kernel

> Prereq:<br>
> [FS.md](FS.md)<br>
> [IX.md](IX.md)<br>


**_Disclaimer:_**<br>
*This guide is not for the faint of heart! It assumes that you have an idea what a statically linked kernel is and know how to build it for your hardware in some source-based distro.*

This guide implies **IX** package manager in your PATH:

```
ix# export PATH=/mnt/ix/home/root/ix:${PATH} # assume we are in stal/IX installer, before reboot
ix# export PATH=/home/root/ix:${PATH} # assume we are in **stal/IX** installer, after reboot
ix# export PATH=/your/local/checkout:${PATH} # assume per user local ix checkout
ix# ix list
```

The guide intended to build a kernel, which contains all the components necessary for operation.

First you need to know the list of modules for your hardware support.

You can download some conventional distro with a working hardware auto-detection system to do this. It needs to execute:

```
ubuntu# lspci -k
03:00.0 Class 0300: 1002:1638 amdgpu
02:00.0 Class 0108: 144d:a809 nvme
03:00.7 Class 1180: 1022:15e4 pcie_mp2_amd
03:00.5 Class 0480: 1022:15e2 snd_rn_pci_acp3x
01:00.0 Class 0280: 8086:2723 iwlwifi
03:00.3 Class 0c03: 1022:1639 xhci_hcd
03:00.1 Class 0403: 1002:1637 snd_hda_intel
00:08.1 Class 0604: 1022:1635 pcieport
00:02.4 Class 0604: 1022:1634 pcieport
03:00.6 Class 0403: 1022:15e3 snd_hda_intel
00:02.2 Class 0604: 1022:1634 pcieport
03:00.4 Class 0c03: 1022:1639 xhci_hcd
03:00.2 Class 1080: 1022:15df ccp
00:14.0 Class 0c05: 1022:790b piix4_smbus
00:08.2 Class 0604: 1022:1635 pcieport
...
```

The last column - a list of modules we need, write it down.

Next we need to prepare a directory with kernel sources, which we are building a config for. Let's say, we want to use kernel 6.0:

```
ix# mkdir kernel
ix# cd kernel

# get current linux kernel source
ix# cat $(dirname $(which ix))/pkgs/bin/kernel/6/0/t/ver.sh
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.0.12.tar.xz
sha:89b730edf8942b49e02f9894244205886c9a214d629b35b88c4ff06ee9304f01

ix# wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.0.12.tar.xz
ix# tar xf linux-6.0.12.tar.xz
ix# cd linux-6.0.12
```

Copy old kernel config to our tree:

```
ix# cp $(dirname $(which ix))/pkgs/bin/kernel/6/0/slot/1/cfg ./.config
```

Run the kernel configurator:

```
ix run set/menuconfig -- make HOSTCC=cc menuconfig
```

You need to find all the modules from the list above in the configurator (it has a search!) and add them to the configuration.

---
Herewith:

 * Don't forget to add all the necessary buses for your devices (USB, I2C, PCIe, NVMe, etc.)
 * Some drivers require firmware. They'll need to be added to ix.sh for your kernel, as done in here: https://github.com/pg83/ix/blob/main/pkgs/bin/kernel/6/0/slot/vbox/ix.sh#L9.<br>
  Pro tip: run `dmesg | grep firmware` on running system for information about missing firmware!
 * Read how to build a kernel generally in a source based distro - https://wiki.gentoo.org/wiki/Kernel/Configuration
---

Or, alternatively, one can combine previous commands into one:

```
...
ix# cd linux-6.0.12
ix# ix tool reconf $(dirname $(which ix))/pkgs/bin/kernel/6/0/slot/1/cfg
```

Mostly, to understand what needs to be included in the kernel config for a particular device operation, it helps to search the Internet, with module's name and a link to Gentoo/Arch, they have the largest knowledge base on the subject:

 * Here, for example, is a list of what needs to be done to get AMD GPU support operating - https://wiki.gentoo.org/wiki/AMDGPU

After the kernel is configured, copy the modified config to the base:

```
ix# cp .config $(dirname $(which ix))/pkgs/bin/kernel/6/0/slot/1/cfg
```

After that you can add the kernel to the system realm in the usual way:

```
ix# ix mut system bin/kernel/6/0/slot/1
ix# ls /bin/kernel-*
/bin/kernel-6-0-12-slot0
```

Remember that path, you will need it later, in GRUB cli or in grub.cfg.

Or, alternatively, you can use separate realm for bootstrap kernel:

```
ix# ix mut kernel bin/kernel/6/0/slot/1
ix# ls /ix/realm/kernel/bin/kernel-*
/ix/realm/kernel/bin/kernel-6-0-12-slot0
```

Remember that path, you will need it later, in GRUB cli or in grub.cfg.
