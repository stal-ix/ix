{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libass
{% endblock %}

{% block version %}
0.17.5
{% endblock %}

{% block fetch %}
https://github.com/libass/libass/archive/refs/tags/{{self.version().strip()}}.tar.gz
fa286fc9ee1ba3b932703a3df7b8474d01dc8abe29ec69b6fa68781dc4bf7acc
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
