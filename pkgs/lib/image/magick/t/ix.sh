{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-7.1.1-3.tar.xz
sha:f47e2218c0d868c1afc065fce54fe073e4fb2269aa81cf98e1b61c2a8eaf417d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/png
lib/raw
lib/heif
lib/jpeg
lib/webp
lib/tiff
lib/lcms/2
lib/openexr
lib/jpeg/open
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block configure_flags %}
--with-jxl=yes
{% endblock %}
