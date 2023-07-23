{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.3.1.tar.gz
sha:b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c8c0c9e6cd3c4ef66
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
PNG_LIBRARY_RELEASE=
ZLIB_LIBRARY_RELEASE=
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir lib/cmake
mv share/WebP/cmake lib/cmake/WebP
find . -type f -name '*.cmake' | while read l; do
    sed -e 's|.*LINK.*Threads::.*||' -i ${l}
done
{% endblock %}
