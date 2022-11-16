{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.nano-editor.org/dist/v7/nano-7.0.tar.xz
sha:8dd6eac38b2b8786d82681f0e1afd84f6b75210d17391b6443c437e451552149
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
