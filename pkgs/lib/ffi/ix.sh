{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v3.4.4.tar.gz
sha:828639972716ed18833df7b659b32060591fe0eb625a8d34078920d33c2dc867
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

{% block setup %}
export CFLAGS="-Wno-implicit-function-declaration ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-system-ffi=yes --with-libffi-prefix=${out} \${COFLAGS}"
{% endblock %}
