{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-47.tar.gz
sha:ad489af583bdfc0b5edd6c2106c955bf3af68fe838f6bd32c0ee8505ec6891ff
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
