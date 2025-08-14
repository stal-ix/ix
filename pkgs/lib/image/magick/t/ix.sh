{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ImageMagick
{% endblock %}

{% block version %}
7.1.2.1
{% endblock %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-{{self.version().strip() | field(0)}}.{{self.version().strip() | field(1)}}.{{self.version().strip() | field(2)}}-{{self.version().strip() | field(3)}}.tar.xz
ead4b5d33efab77ec84335a0be9c34a0fa7e3693456bf05e76d3fa492ad6ebbb
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
