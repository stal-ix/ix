{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-20220209.tar.gz
sha:1ff936dc3946affa2695f31024b22e117b3faf9aa7b8857aba1d0473cd277897
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-20240312.tar.gz
sha:89cbac35d1bd21ebf64936d764ccd01d4e0b6cde973e3b940f8ad2bac9086ec8
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
{% endblock %}

{% block install %}
mkdir ${out}/lib
rsync -a linux-firmware-20220209/ ${out}/lib/
rsync -a linux-firmware-20240312/ ${out}/lib/
{% endblock %}

{% block env %}
export LINUX_FIRMWARE="${out}/lib"
{% endblock %}
