{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libgd
{% endblock %}

{% block version %}
2.3.3
{% endblock %}

{% block fetch %}
https://github.com/libgd/libgd/archive/refs/tags/gd-{{self.version().strip()}}.tar.gz
md5:f75f9721b858f25acc5c7c917ab7ccba
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/webp
lib/jpeg
lib/heif
lib/tiff
lib/iconv
lib/freetype
lib/fontconfig
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
