{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/3.1.5.tar.gz
sha:8a7e09c887edce97f8780dba8a060026c3551da48252819400d7af1c5eacf871
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
