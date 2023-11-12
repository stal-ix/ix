{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/b2
lib/xz
lib/lz4
lib/lzo
lib/zstd
lib/iconv
lib/expat
lib/bzip/2
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_UNZIP=OFF
ENABLE_CPIO=OFF
ENABLE_CAT=OFF
ENABLE_TAR=OFF
{% endblock %}

{% block test %}
{{super()}}
test -f ${out}/lib/libarchive.a
{% endblock %}
