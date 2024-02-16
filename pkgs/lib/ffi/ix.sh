{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v3.4.5.tar.gz
sha:0b942b74ed3ffc5e7670187a7ddb23ad5b51ed8d14317737f26e0431d1258f53
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_tool %}
bld/auto(conf_ver=2/71,std_box=bld/boot/box)
bld/texinfo
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-implicit-function-declaration ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-system-ffi=yes --with-libffi-prefix=${out} \${COFLAGS}"
{% endblock %}
