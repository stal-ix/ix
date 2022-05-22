{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-20220209.tar.gz
sha:1ff936dc3946affa2695f31024b22e117b3faf9aa7b8857aba1d0473cd277897
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract0 ${src}/*.gz
{% endblock %}

{% block install %}
mkdir ${out}/share/
cp -R linux-firmware* ${out}/share/firmware
{% endblock %}

{% block env %}
export LINUX_FIRMWARE="${out}/share/firmware"
{% endblock %}
