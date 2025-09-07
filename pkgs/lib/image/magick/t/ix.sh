{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ImageMagick
{% endblock %}

{% block version %}
7.1.2.3
{% endblock %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-{{self.version().strip() | field(0)}}.{{self.version().strip() | field(1)}}.{{self.version().strip() | field(2)}}-{{self.version().strip() | field(3)}}.tar.xz
2943d26f9ac4875aacf16c8f717f4d32ac985fe6a0c0a8e48c24c5cbb3161050
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
