{% extends '//lib/zstd/t/ix.sh' %}

{% block build_flags %}
{{super()}}
fix_shebangs
{% endblock %}

{% block bld_libs %}
lib/z
lib/xz
lib/lz4
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|(contentChecksum_t)|(LZ4F_contentChecksum_t)|' -i ../../programs/fileio.c
{% endblock %}

{% block cmake_flags %}
{{super()}}
ZSTD_LZ4_SUPPORT=ON
ZSTD_LZMA_SUPPORT=ON
ZSTD_ZLIB_SUPPORT=ON
{% endblock %}
