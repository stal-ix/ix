{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nano
{% endblock %}

{% block version %}
8.4
{% endblock %}

{% block fetch %}
https://www.nano-editor.org/dist/v8/nano-{{self.version().strip()}}.tar.xz
sha:5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41f36c97be2a8e628d
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
