{% extends '//die/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.2.3.tar.gz
sha:f5d7ab2390b06b8a934a4fc35784291b3885b557780d099bd32f09241f9d83f9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir lib/cmake
mv share/WebP/cmake lib/cmake/WebP
{% endblock %}
