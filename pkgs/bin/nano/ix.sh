{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nano
{% endblock %}

{% block version %}
9.3
{% endblock %}

{% block fetch %}
https://www.nano-editor.org/dist/v{{self.version().strip() | field(0)}}/nano-{{self.version().strip()}}.tar.xz
a9affc52c9596ee0682bcdd4ceb3c0b235eb221d83d733dfd9b0dff45897cb0d
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
