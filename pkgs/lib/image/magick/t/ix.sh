{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-44.tar.gz
sha:1532c08c4f047aaf04e2717aac23c6d866d7e17d60a5d2c320ae29874285d49f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/png
lib/jpeg
lib/webp
lib/tiff
lib/openexr
lib/jpeg/open
{% endblock %}

{% block bld_tool %}
bld/scripts/fakegit
{% endblock %}

{% block configure_flags %}
--with-jxl=yes
{% endblock %}
