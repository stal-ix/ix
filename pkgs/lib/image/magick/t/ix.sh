{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/ImageMagick-7.1.0-59.tar.xz
sha:ee2247f2ad8798e674de7fba37e7f3986f5b6be9abec042ab00b0befa8ae5b70
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/png
lib/raw
lib/jpeg
lib/webp
lib/tiff
lib/openexr
lib/jpeg/open
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block configure_flags %}
--with-jxl=yes
{% endblock %}
