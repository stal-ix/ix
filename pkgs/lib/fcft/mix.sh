{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/2.5.0.tar.gz
1f0f7e7e19e298781b93052803a36e56
{% endblock %}

{% block lib_deps %}
lib/c
lib/tllist
lib/pixman
lib/freetype
lib/harfbuzz
lib/utf8proc
lib/fontconfig
{% endblock %}

{% block bld_tool %}
dev/doc/scdoc
{% endblock %}
