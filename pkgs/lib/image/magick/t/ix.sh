{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-7.1.1-44.tar.xz
sha:7e244bce3962228055839e020dde0d37fb428745815a09a2250ffe21eb9ec34d
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
