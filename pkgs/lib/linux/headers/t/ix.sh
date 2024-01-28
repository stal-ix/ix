{% extends '//die/c/ix.sh' %}

{% block std_box %}
bld/make
{{super()}}
{% endblock %}

{% block setup_tools %}
ln -s ${HOST_CC} gcc
{% endblock %}

{% block build %}
make mrproper
make CROSS_COMPILE=1 ARCH={{target.linux_arch}} headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
{% endblock %}

{% block install %}
cp -rv usr/include ${out}/
{% endblock %}

{% block env %}
export KERNEL_HEADERS=${out}/include
export CPPFLAGS="-isystem ${out}/include \${CPPFLAGS}"
{% endblock %}
