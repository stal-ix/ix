{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-7.1.1-5.tar.xz
sha:2dd0e6600dfb087d79ceac2ef9d71e9dc7faf306aa7f3543d2400059b19b420f
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
