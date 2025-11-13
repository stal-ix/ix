{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nano
{% endblock %}

{% block version %}
8.7
{% endblock %}

{% block fetch %}
https://www.nano-editor.org/dist/v8/nano-{{self.version().strip()}}.tar.xz
afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/intl
lib/magic
lib/curses
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/groff
bld/gettext
{% endblock %}

{% block configure_flags %}
--enable-utf8
{% endblock %}
