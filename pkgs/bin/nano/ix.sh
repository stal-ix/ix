{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.nano-editor.org/dist/v8/nano-8.2.tar.xz
sha:d5ad07dd862facae03051c54c6535e54c7ed7407318783fcad1ad2d7076fffeb
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
