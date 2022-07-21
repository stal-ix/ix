{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libass/libass/archive/refs/tags/0.16.0.tar.gz
sha:246091cf034b097dbe362c72170e6996f8d2c19ffe664ce6768ec44eb9ca5c1c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/fribidi
lib/freetype
lib/harfbuzz
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
