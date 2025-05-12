{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
mold
{% endblock %}

{% block version %}
2.39.1
{% endblock %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:231ea3643a14fe5b88478c97b68b31f7c975b57b247a81356ffd889d015b5cc1
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
