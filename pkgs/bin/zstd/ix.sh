{% extends '//lib/zstd/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/xz
lib/lz4
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ZSTD_LZ4_SUPPORT=ON
ZSTD_LZMA_SUPPORT=ON
ZSTD_ZLIB_SUPPORT=ON
{% endblock %}
