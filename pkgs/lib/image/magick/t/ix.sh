{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-7.1.1-46.tar.xz
sha:026d2c73fbfd92923b7da880973812913957babd437e9063dcdf7fdba9054f8a
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

{% block patch %}
sed -e 's|.*operator new.*|#include <new>|' \
    -i Magick++/lib/Magick++/Include.h
{% endblock %}

{% block configure_flags %}
--with-jxl=yes
{% endblock %}
