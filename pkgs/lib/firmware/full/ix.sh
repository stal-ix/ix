{% extends '//die/std/ix.sh' %}

{% block version %}
20220209
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-{{self.version().strip()}}.tar.gz
sha:1ff936dc3946affa2695f31024b22e117b3faf9aa7b8857aba1d0473cd277897
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-20240312.tar.gz
sha:89cbac35d1bd21ebf64936d764ccd01d4e0b6cde973e3b940f8ad2bac9086ec8
https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/snapshot/wireless-regdb-master-2023-09-01.tar.gz
sha:77b22a854bd2a3315532972f57988b48d6e79b3317f212363fca9471224e5274
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/rsync
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract 0 ${src}/linux-firmware-20220209.tar.gz
extract 0 ${src}/linux-firmware-20240312.tar.gz
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
