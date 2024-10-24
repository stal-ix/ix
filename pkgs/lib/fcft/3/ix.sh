{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/3.1.9.tar.gz
sha:4b7e3b2ab7e14f532d8a9cb0f2d3b0cdf9d2919b95e6ab8030f7ac87d059c2b6
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
