{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-7.1.1-12.tar.xz
sha:a761aa8c3b0690910600ba838d15379b676820f1ed912382d31c9b5da1ca1878
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
