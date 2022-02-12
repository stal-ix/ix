{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-1.0.tar.xz
88752c7859212f9c7a0f6cbf7a273535
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block autoreconf %}
sh autogen.sh --skip-gnulib
{% endblock %}

{% block bld_tool %}
bld/autohell
bin/auto/conf/2/71
bin/auto/make/1/16
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block make_verbose_1 %}
V=1
{% endblock %}

{% block c_rename_symbol %}
locale_charset
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libunistring-prefix=${out} \${COFLAGS}"
{% endblock %}
