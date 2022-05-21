{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/libgd/libgd/archive/refs/tags/gd-2.3.3.tar.gz
f75f9721b858f25acc5c7c917ab7ccba
{% endblock %}

{% block lib_deps %}
lib/c
lib/webp
lib/jpeg
lib/png
lib/heif
lib/tiff
lib/iconv
lib/freetype
lib/fontconfig
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
