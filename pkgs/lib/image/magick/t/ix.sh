{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/releases/ImageMagick-7.1.0-60.tar.xz
sha:ea1a6de16328b0801d684df02498334bff5ad70521f0c509ea9f1209eb4ac5f6
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
