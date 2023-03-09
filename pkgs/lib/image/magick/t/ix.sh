{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-7.1.1-0.tar.xz
sha:155a0fffafa1f7079ff9d017598da736a22ebb54e931447283874cf20a4fa331
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
