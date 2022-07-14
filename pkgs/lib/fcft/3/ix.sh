{% extends '//die/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/3.1.2.tar.gz
sha:f571afe693d3fa11fe36e97c7a2ecbbf9313755ee31c1ec3dcc648796b8e6db0
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
