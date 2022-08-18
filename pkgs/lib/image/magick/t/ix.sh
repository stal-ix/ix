{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-46.tar.gz
sha:51e9863ae4a52d6477da0aecc4f79ebccfc5da2721e7a0e63bf09f41700da43c
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
