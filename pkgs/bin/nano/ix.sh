{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nano
{% endblock %}

{% block version %}
8.5
{% endblock %}

{% block fetch %}
https://www.nano-editor.org/dist/v8/nano-{{self.version().strip()}}.tar.xz
sha:000b011d339c141af9646d43288f54325ff5c6e8d39d6e482b787bbc6654c26a
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
