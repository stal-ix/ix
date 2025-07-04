{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libfuse
{% endblock %}

{% block version %}
2.9.9
{% endblock %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-{{self.version().strip()}}.tar.gz
e57a24721177c3b3dd71cb9239ca46b4dee283db9388d48f7ccd256184982194
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block autoreconf %}
>config.rpath
sh makeconf.sh
{% endblock %}

{% block configure_flags %}
--enable-lib
--disable-util
--disable-example
{% endblock %}
