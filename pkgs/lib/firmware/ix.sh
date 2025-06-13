{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220209.tar.xz
e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994b4bfc35394d177
https://www.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240312.tar.xz
b2327a54ad1897c828008caf63af5ee15469ba723a5016be58f2b44f07bd4b94
https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/snapshot/wireless-regdb-master-2023-09-01.tar.gz
77b22a854bd2a3315532972f57988b48d6e79b3317f212363fca9471224e5274
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/rsync
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract 0 ${src}/linux-firmware-20220209.tar.xz
extract 0 ${src}/linux-firmware-20240312.tar.xz
extract 0 ${src}/wireless-regdb-master-2023-09-01.tar.gz
{% endblock %}

{% block install %}
mkdir ${out}/lib
rsync -a linux-firmware-20220209/ ${out}/lib/
rsync -a linux-firmware-20240312/ ${out}/lib/
rsync -a wireless-regdb-master-2023-09-01/regulatory.* ${out}/lib/
{% endblock %}

{% block env %}
export LINUX_FIRMWARE="${out}/lib"
{% endblock %}
