{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libass
{% endblock %}

{% block version %}
0.17.4
{% endblock %}

{% block fetch %}
https://github.com/libass/libass/archive/refs/tags/{{self.version().strip()}}.tar.gz
c287d180d93dc9c9021872574b618ac49027e84cc90e1289318b1ee68bb42251
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
