{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://nano-editor.org/dist/v6/nano-6.3.tar.xz
sha:eb532da4985672730b500f685dbaab885a466d08fbbf7415832b95805e6f8687
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
