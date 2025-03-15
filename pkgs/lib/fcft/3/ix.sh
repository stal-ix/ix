{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/3.3.1.tar.gz
sha:f18bf79562e06d41741690cd1e07a02eb2600ae39eb5752eef8a698f603a482c
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
