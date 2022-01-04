{% extends '//mix/template/kconfig.sh' %}

{% block fetch %}
https://busybox.net/downloads/busybox-1.35.0.tar.bz2
585949b1dd4292b604b7d199866e9913
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block bld_tool %}
lib/bzip2
dev/tool/perl
{% endblock %}

{% block setup_tools %}
ln -s $(which llvm-strip) strip
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block install %}
{{super()}}

mkdir ${out}/bin
mv _install/bin/busybox ${out}/bin/
cd ${out}/bin

./busybox --list-full | while read l; do
    ln -s busybox $(echo ${l} | sed -e 's/.*\///')
done
{% endblock %}
