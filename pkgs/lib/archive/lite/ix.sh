{% extends '//lib/archive/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/bzip/2
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_LZ4=OFF
ENABLE_ZSTD=OFF
ENABLE_EXPAT=OFF
ENABLE_ICONV=OFF
ENABLE_LIBB2=OFF
ENABLE_PCREPOSIX=OFF
{% endblock %}

{% block test %}
{{super()}}
test -f ${out}/lib/libarchive.a
{% endblock %}
