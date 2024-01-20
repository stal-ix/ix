{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libass/libass/archive/refs/tags/0.17.1.tar.gz
sha:5ba42655d7e8c5e87bba3ffc8a2b1bc19c29904240126bb0d4b924f39429219f
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/fribidi
lib/unibreak
lib/freetype
lib/harfbuzz
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}
