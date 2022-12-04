{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-52.tar.gz
sha:bacd6d63f16482f269bf5cfe76d34b9a2b01ec737e9cb41fd2612d37f34698fc
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
