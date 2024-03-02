{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v2.4.1.tar.gz
sha:c9853d007d6a1b4f3e36b7314346751f4cc91bc43c76e30db51709b53b44dd68
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/zstd
lib/xxhash
lib/openssl
lib/blake3/c
lib/intel/tbb
{% endblock %}

{% block cmake_flags %}
MOLD_LTO=OFF
MOLD_USE_MOLD=OFF
MOLD_USE_MIMALLOC=OFF
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
        -e 's|../xxhash.h|xxhash.h|' \
        -i ${l}
done
{% endblock %}
