{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.nano-editor.org/dist/v8/nano-8.3.tar.xz
sha:551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d854a3ca3778f111e
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
