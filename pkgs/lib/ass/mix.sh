{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/libass/libass/archive/refs/tags/0.15.2.tar.gz
sha:f96b7ce35f2b0bf430eb71c4c9dd5d8f0abf52499e08490d346608c837c98299
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
