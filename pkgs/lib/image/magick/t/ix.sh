{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://imagemagick.org/archive/ImageMagick-7.1.0-56.tar.xz
sha:34baaf61a8c47d710666f03a4779048fd79c8e0a0910cf7b82e95961af127594
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
