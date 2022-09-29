{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.5.1.tar.gz
sha:ec94aa74758f1bc199a732af95c6304ec98292b87f2f4548ce8436a7c5b054a1
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
