{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/3.1.6.tar.gz
sha:95797f945faf407cb658efe6e5dcf0cc3ab08ef01e159383f9cf7cf5ee257506
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
