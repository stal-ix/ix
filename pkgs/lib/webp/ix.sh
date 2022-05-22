{% extends '//die/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.2.1.tar.gz
f30c738034faa13d6255604ed46b6158
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir lib/cmake
# TODO(pg):check this strange cmake shit
mv share/WebP/cmake lib/cmake/WebP
{% endblock %}
