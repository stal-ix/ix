{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fcft
{% endblock %}

{% block version %}
3.3.2
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/{{self.version().strip()}}.tar.gz
79e52aaafc0b57fa2b68ed6127de13e98318050399a939691b8ca30d44d48591
{% endblock %}

{% block lib_deps %}
lib/c
lib/tllist
lib/pixman
lib/freetype
lib/harfbuzz
lib/utf8/proc
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
{% endblock %}
