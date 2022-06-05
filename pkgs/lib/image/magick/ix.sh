{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-37.tar.gz
sha:a54888a1a46dbb808705a3e6c6b5ecb93ee30189a8ae6ea0f02300a0ab0d0996
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
