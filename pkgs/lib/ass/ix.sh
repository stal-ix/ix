{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.17.3
{% endblock %}

{% block fetch %}
https://github.com/libass/libass/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:26fbfb7a7bd3e6d5c713f8a65a12b36084d1dde6efaed8a9996489054c4aeca0
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
