{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-50.tar.gz
sha:3fac7d2be943f754822c19f80b2b1fa431b1cd68efb35a4ba8eb309fb5bfa79f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/png
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
