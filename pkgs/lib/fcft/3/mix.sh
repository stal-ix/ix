{% extends '//mix/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/3.1.1.tar.gz
sha:5f35dbd8a1a81ec61648e86e8f86157c9fd905ee199540d81a031121473204d5
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
bin/scdoc
{% endblock %}
