{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
#https://github.com/libffi/libffi/archive/refs/tags/v3.4.2.tar.gz
#sha:0acbca9fd9c0eeed7e5d9460ae2ea945d3f1f3d48e13a4c54da12c7e0d23c313
https://github.com/libffi/libffi/archive/refs/tags/v3.4.3.tar.gz
sha:66fe321955762834b47efefc7935d96d14fb0ebeb86f7d31516691cbd3b09b29
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_tool %}
bld/auto(conf_ver=2/71,std_box=bld/boot/box)
bld/texinfo
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-implicit-function-declaration ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-system-ffi=yes --with-libffi-prefix=${out} \${COFLAGS}"
{% endblock %}
