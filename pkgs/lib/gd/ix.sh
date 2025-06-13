{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libgd
{% endblock %}

{% block version %}
2.3.3
{% endblock %}

{% block fetch %}
https://github.com/libgd/libgd/archive/refs/tags/gd-{{self.version().strip()}}.tar.gz
24429f9d0dbe0f865aaa4b1a63558242396ba9134e6cfd32ca5e486a84483350
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
