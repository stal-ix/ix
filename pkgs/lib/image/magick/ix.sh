{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-38.tar.gz
sha:c04abd6b873e160a67e971b39f248c6cbfc279dd3f4812d9a0ad63b30ab0063a
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
