{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://nano-editor.org/dist/v6/nano-6.4.tar.xz
sha:4199ae8ca78a7796de56de1a41b821dc47912c0307e9816b56cc317df34661c0
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block configure_flags %}
--enable-utf8
{% endblock %}
