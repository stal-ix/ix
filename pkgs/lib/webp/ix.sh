{% extends 't/ix.sh' %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block cmake_flags %}
{{super()}}
WEBP_BUILD_ANIM_UTILS=OFF
WEBP_BUILD_CWEBP=OFF
WEBP_BUILD_DWEBP=OFF
WEBP_BUILD_GIF2WEBP=OFF
WEBP_BUILD_IMG2WEBP=OFF
WEBP_BUILD_VWEBP=OFF
WEBP_BUILD_EXTRAS=OFF
WEBP_BUILD_WEBPINFO=OFF
WEBP_BUILD_WEBPMUX=OFF
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
