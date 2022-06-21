{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-39.tar.gz
sha:eb8150517933caad6288a0fbf01e7616bfe95d0f650fac227541668ee10aff05
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/png
lib/jpeg
lib/webp
lib/openexr
lib/jpeg/open
{% endblock %}
