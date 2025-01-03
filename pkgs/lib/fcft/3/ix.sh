{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/3.1.10.tar.gz
sha:4f4807d708f3a195e9a3caaa1ff9171b678af63a7af1c470a8984d601a4514de
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
