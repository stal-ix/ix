{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/ImageMagick/ImageMagick/archive/refs/tags/7.1.0-36.tar.gz
sha:ef73686478112bddabafbb2851ebe55d7d234d194ba3cfbe423e6075f174a7cf
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
