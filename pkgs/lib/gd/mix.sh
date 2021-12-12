{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/libgd/libgd/archive/refs/tags/gd-2.3.3.tar.gz
f75f9721b858f25acc5c7c917ab7ccba
{% endblock %}

{% block lib_deps %}
lib/webp/mix.sh
lib/jpeg/mix.sh
lib/png/mix.sh
lib/heif/mix.sh
lib/tiff/mix.sh
lib/iconv/mix.sh
lib/freetype/mix.sh
lib/fontconfig/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1/16/mix.sh
{% endblock %}

{% block autoreconf %}
dash bootstrap.sh
{% endblock %}
