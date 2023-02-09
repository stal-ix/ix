{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/freetype/freetype/archive/refs/tags/VER-2-13-0.tar.gz
sha:a683f1091aee95d2deaca9292d976f87415610b8ae1ea186abeebcb08e83ab12
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
