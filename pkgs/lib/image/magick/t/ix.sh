{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-41.tar.gz
sha:f8ec06b5c82cbab4734b166b820f151323c78f438580daa176cedc63990c00a2
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
bld/scripts/fakegit
{% endblock %}

{% block configure_flags %}
--with-jxl=yes
{% endblock %}
