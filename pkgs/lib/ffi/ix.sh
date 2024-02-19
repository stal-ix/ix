{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v3.4.6.tar.gz
sha:9ac790464c1eb2f5ab5809e978a1683e9393131aede72d1b0a0703771d3c6cda
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
