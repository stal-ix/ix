{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.6.0.tar.gz
sha:59cd3ea1a2a5fb50d0d97faddd8bff4c7e71054a576c00a87b17f56ecbd88729
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/zstd
lib/xxhash
lib/openssl
lib/intel/tbb
{% endblock %}

{% block cmake_flags %}
MOLD_LTO=OFF
MOLD_USE_MOLD=OFF
MOLD_USE_MIMALLOC=OFF
MOLD_MOSTLY_STATIC=ON
MOLD_USE_SYSTEM_TBB=ON
{% endblock %}

{% block patch %}
rm -r third-party/tbb
rm -r third-party/xxhash
rm -r third-party/mimalloc

find . -type f | while read l; do
    sed -e 's|mold-wrapper SHARED|mold-wrapper STATIC|' \
        -e 's|xxhash/xxhash.h|xxhash.h|' \
        -e 's|third-party/xxhash.h|xxhash.h|' \
        -i ${l}
done
{% endblock %}
