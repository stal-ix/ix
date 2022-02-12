{% extends '//mix/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/3.0.1.tar.gz
sha:0d9b9f3add24aef5efcf42a32e8ad0e50060e1441a491e04fff3d79a36a526ea
{% endblock %}

{% block lib_deps %}
lib/c
lib/tllist
lib/pixman
lib/freetype
lib/harfbuzz
lib/utf8proc
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
{% endblock %}
