{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/2.5.0.tar.gz
1f0f7e7e19e298781b93052803a36e56
{% endblock %}

{% block lib_deps %}
lib/tllist/mix.sh
lib/pixman/mix.sh
lib/freetype/mix.sh
lib/harfbuzz/mix.sh
lib/utf8proc/mix.sh
lib/fontconfig/mix.sh
{% endblock %}

{% block bld_tool %}
dev/doc/scdoc/mix.sh
{% endblock %}
