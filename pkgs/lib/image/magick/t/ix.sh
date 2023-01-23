{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-58.tar.gz
sha:5767f49cf94bff82b558d79c8039f60c8ea4b51753c6e4b0f16a9442293cfa67
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
