{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libass/libass/archive/refs/tags/0.17.2.tar.gz
sha:db30b6122a9c6fb5a29e0ed8393b37d3dc5b0ef0025043fff631f863b28ea477
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
