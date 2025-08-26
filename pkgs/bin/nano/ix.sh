{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nano
{% endblock %}

{% block version %}
8.6
{% endblock %}

{% block fetch %}
https://www.nano-editor.org/dist/v8/nano-{{self.version().strip()}}.tar.xz
f7abfbf0eed5f573ab51bd77a458f32d82f9859c55e9689f819d96fe1437a619
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
