{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.4.2.tar.gz
sha:47e6c48d20f49e5b47dfb8197dd9ffcb11a8833d614f7a03bd29741c658a69cd
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
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
