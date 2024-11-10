{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-7.1.1-40.tar.xz
sha:eb2ab9203e1a2b5c7a9d40e0084fcd64cbebc952b51dfff057841fcb8a262b7a
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
