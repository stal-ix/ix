{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-1.0.tar.xz
88752c7859212f9c7a0f6cbf7a273535
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/71
dev/build/auto/make/1/16
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}

{% block make_verbose_1 %}
V=1
{% endblock %}

{% block c_rename_symbol %}
locale_charset
{% endblock %}

{% block env %}
export COFLAGS="--with-libunistring-prefix=${out} \${COFLAGS}"
{% endblock %}
