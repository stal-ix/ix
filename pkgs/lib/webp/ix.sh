{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.2.4.tar.gz
#sha:7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df
https://github.com/webmproject/libwebp/archive/ce2f2d668e56f0aaca3550a28118eaba5ce861c5.tar.gz
sha:4ad359ef12e768a8608061b82010e5abaf9e2858563f4d776e29371c5c9b6876
{% endblock %}

{% block lib_deps %}
lib/c
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
