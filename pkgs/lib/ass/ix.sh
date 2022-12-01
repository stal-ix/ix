{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libass/libass/archive/refs/tags/0.17.0.tar.gz
sha:90ca569bcd47eea1e170d8c5dfd1e6208f1c1b70f8cf67d4219916af02e34c09
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
