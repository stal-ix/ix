{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-45.tar.gz
sha:3df6ca6dff15a4e8a20b4593c60285a59e38890440494d91a344e5c0e2bb3eec
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
