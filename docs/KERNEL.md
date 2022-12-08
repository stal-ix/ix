This guide assume ix package manager in your PATH:

```
export PATH=/path/to/ix/checkout:${PATH}
```

Эта инструкция предназначена для сборки ядра, которое содержит в себе все компоненты, необходимые для работы.

Сначала вам нужно узнать список модулей для поддержки вашего оборудования.

Для этого мможно загрузить какой-нибудь conventional дистрибутив, с работающей системой автоопределения оборудования. В нем нужно выполнить:

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

Последняя колонка - это список необходимых нам модулей, запишем его на бумажку.

Далее нам нужно подготовить директорию с исходниками ядра, для которых мы строим конфиг. Допустим, мы хотим использовать ядро 6.0:

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

Скопируем старый конфиг ядра в наше дерево:

```
pg-> cp $(dirname $(which ix))/pkgs/bin/kernel/6/0/slot/1/cfg ./.config
```

Запустим конфигуратор ядра:

```
ix run set/menuconfig -- make HOSTCC=cc menuconfig
```

В конфигураторе вам нужно найти(там есть поиск!) все модули из списка выше, и добавить в конфигурацию.

При этом:

 * Нужно не забыть добавить все нужные шины для ваших устройств(USB, I2C, PCIe, NVMe, и так далее)
 * Для каких-то драйверов нужны firmware. Их нужно будет добавить в ix.sh для вашего ядра, как это сделано в https://github.com/pg83/ix/blob/main/pkgs/bin/kernel/6/0/slot/vbox/ix.sh#L9

Чаще всего для понимания того, что надо включить в конфиге ядра для работы того или иного устройства, помогает поиск в Internet, с именем модуля, и ссылкой на Gentoo/Arch, у них самая большая база знаний на эту тему:

 * Вот, например, список того, что нужно проделать для работающей поддержки AMD GPU - https://wiki.gentoo.org/wiki/AMDGPU

После того как ядро сконфигурировано, скопируем измененный конфиг на базу:

```
pg-> cp .config $(dirname $(which ix))/pkgs/bin/kernel/6/0/slot/1/cfg
```

После чего можно, обычным образом, добавить ядро в системный realm:

```
pg-> ix mut system bin/kernel/6/0/slot/1
```
