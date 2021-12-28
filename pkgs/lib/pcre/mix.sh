{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/pcre/pcre/8.45/pcre-8.45.tar.bz2
4452288e6a0eefb2ab11d36010a1eebb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/z
lib/bzip2
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}

{% block configure_flags %}
--enable-pcregrep-libz
--enable-pcregrep-libbz2
--enable-unicode-properties
--enable-pcre16
--enable-pcre32
--enable-jit
--disable-cpp
{% endblock %}

{% block env %}
export COFLAGS="--with-pcre=${out} \${COFLAGS}"
{% endblock %}
