Disclaimer: this guide is not for the faint of heart! It assumes that you have an idea what a statically linked kernel is and know how to build it for your hardware in some source-based distro.

This guide implies ix package manager in your PATH:

```
export PATH=/path/to/ix/checkout:${PATH}
```

The guide intended to build a kernel, which contains all the components necessary for operation.

First you need to know the list of modules for your hardware support.

You can download some conventional distro with a working hardware auto-detection system to do this. It needs to execute:

```
pg-> lspci -k
03:00.0 Class 0300: 1002:1638 amdgpu
00:08.0 Class 0600: 1022:1632
00:18.3 Class 0600: 1022:166d
00:18.1 Class 0600: 1022:166b
02:00.0 Class 0108: 144d:a809 nvme
03:00.7 Class 1180: 1022:15e4 pcie_mp2_amd
00:01.0 Class 0600: 1022:1632
03:00.5 Class 0480: 1022:15e2 snd_rn_pci_acp3x
00:14.3 Class 0601: 1022:790e
04:00.1 Class 0106: 1022:7901
01:00.0 Class 0280: 8086:2723 iwlwifi
03:00.3 Class 0c03: 1022:1639 xhci_hcd
00:00.2 Class 0806: 1022:1631
00:18.6 Class 0600: 1022:1670
03:00.1 Class 0403: 1002:1637 snd_hda_intel
00:00.0 Class 0600: 1022:1630
00:08.1 Class 0604: 1022:1635 pcieport
00:18.4 Class 0600: 1022:166e
00:18.2 Class 0600: 1022:166c
00:02.4 Class 0604: 1022:1634 pcieport
00:18.0 Class 0600: 1022:166a
03:00.6 Class 0403: 1022:15e3 snd_hda_intel
00:02.2 Class 0604: 1022:1634 pcieport
03:00.4 Class 0c03: 1022:1639 xhci_hcd
04:00.0 Class 0106: 1022:7901
00:02.0 Class 0600: 1022:1632
00:18.7 Class 0600: 1022:1671
03:00.2 Class 1080: 1022:15df ccp
00:14.0 Class 0c05: 1022:790b piix4_smbus
00:08.2 Class 0604: 1022:1635 pcieport
00:18.5 Class 0600: 1022:166f
```

The last column - a list of modules we need, write it down.

Next we need to prepare a directory with kernel sources, which we are building a config for. Let's say, we want to use kernel 6.0:

```
pg-> mkdir kernel; cd kernel

# get current linux kernel source
pg-> cat $(dirname $(which ix))/pkgs/bin/kernel/6/0/t/ver.sh
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.0.12.tar.xz
sha:89b730edf8942b49e02f9894244205886c9a214d629b35b88c4ff06ee9304f01

pg-> wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.0.12.tar.xz
pg-> tar xf linux-6.0.12.tar.xz
pg-> cd linux-6.0.12
```

Copy old kernel config to our tree:

```
pg-> cp $(dirname $(which ix))/pkgs/bin/kernel/6/0/slot/1/cfg ./.config
```

Run the kernel configurator:

```
ix run set/menuconfig -- make HOSTCC=cc menuconfig
```

You need to find all the modules from the list above in the configurator (it has a search!) and add them to the configuration.

Herewith:

 * Don’t forget to add all the necessary buses for your devices (USB, I2C, PCIe, NVMe, etc.)
 * Some drivers require firmware. They’ll need to be added to ix.sh for your kernel, as done in here: https://github.com/pg83/ix/blob/main/pkgs/bin/kernel/6/0/slot/vbox/ix.sh#L9
 * Read how to build a kernel generally in a source based distro - https://wiki.gentoo.org/wiki/Kernel/Configuration

Mostly, to understand what needs to be included in the kernel config for a particular device operation, it helps to search the Internet, with module’s name and a link to Gentoo/Arch, they have the largest knowledge base on the subject:

 * Here, for example, is a list of what needs to be done to get AMD GPU support operating - https://wiki.gentoo.org/wiki/AMDGPU

After the kernel is configured, copy the modified config to the base:

```
pg-> cp .config $(dirname $(which ix))/pkgs/bin/kernel/6/0/slot/1/cfg
```

After that you can add the kernel to the system realm in the usual way:

```
pg-> ix mut system bin/kernel/6/0/slot/1
```
