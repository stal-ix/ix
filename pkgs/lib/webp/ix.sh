{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.3.0.tar.gz
sha:64ac4614db292ae8c5aa26de0295bf1623dbb3985054cb656c55e67431def17c
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
