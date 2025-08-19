{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/firmware/linux-firmware-20250808.tar.xz
c029551b45a15926c9d7a5df1a0b540044064f19157c57fc11d91fd0aade837f
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
extract 0 ${src}/linux-firmware-20250808.tar.xz
extract 0 ${src}/wireless-regdb-master-2023-09-01.tar.gz
{% endblock %}

{% block install %}
mkdir ${out}/lib
rsync -a linux-firmware-20250808/ ${out}/lib/
rsync -a wireless-regdb-master-2023-09-01/regulatory.* ${out}/lib/
{% endblock %}

{% block env %}
export LINUX_FIRMWARE="${out}/lib"
{% endblock %}
