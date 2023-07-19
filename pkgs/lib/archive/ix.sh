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

{% block test %}
{{super()}}
test -f ${out}/lib/libarchive.a
{% endblock %}
