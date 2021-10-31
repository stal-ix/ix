{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://busybox.net/downloads/busybox-1.34.0.tar.bz2
# md5 9812d59bd5ff22bd424dabded393b52d
{% endblock %}

{% block deps %}
# bld lib/linux/package.sh
# bld env/c/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}

{% block toolconf %}
rm strip
{% endblock %}

{% block cflags %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block configure %}
make defconfig
{% endblock %}

{% block install %}
make install

mkdir ${out}/bin
mv _install/bin/busybox ${out}/bin/
cd ${out}/bin

./busybox --list-full | while read l; do
    ln -s busybox $(echo ${l} | sed -e 's/.*\///')
done
{% endblock %}
