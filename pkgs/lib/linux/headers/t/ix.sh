{% extends '//die/c/ix.sh' %}

{% block std_box %}
bld/make
{{super()}}
{% endblock %}

{% block build %}
make mrproper
make CROSS_COMPILE=1 HOSTCC=${HOST_CC} ARCH={{target.linux_arch}} headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
{% endblock %}

{% block install %}
cp -rv usr/include ${out}/
{% endblock %}

{% block setup_target_tc %}
echo 'no need for target toolchain here'
{% endblock %}

{% block env %}
export KERNEL_HEADERS=${out}/include
export CPPFLAGS="-isystem ${out}/include \${CPPFLAGS}"
{% endblock %}
