{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.nano-editor.org/dist/v7/nano-7.1.tar.xz
sha:57ba751e9b7519f0f6ddee505202e387c75dde440c1f7aa1b9310cc381406836
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
