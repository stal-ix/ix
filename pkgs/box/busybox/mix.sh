{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://busybox.net/downloads/busybox-1.34.0.tar.bz2
9812d59bd5ff22bd424dabded393b52d
{% endblock %}

{% block bld_libs %}
lib/linux/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block toolconf %}
rm strip

ln -s $(which llvm-strip) strip
{% endblock %}

{% block setup %}
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
