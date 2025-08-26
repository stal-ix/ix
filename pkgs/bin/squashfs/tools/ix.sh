{% extends '//die/c/make.sh' %}

{% block pkg_name %}
squashfs-tools
{% endblock %}

{% block version %}
4.7.2
{% endblock %}

{% block fetch %}
https://github.com/plougher/squashfs-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
4672b5c47d9418d3a5ae5b243defc6d9eae8275b9771022247c6a6082c815914
{% endblock %}

{% block unpack %}
{{super()}}
cd squashfs-tools
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/help2man
{% endblock %}

{% block make_flags %}
XZ_SUPPORT=1
LZ4_SUPPORT=1
LZO_SUPPORT=1
ZSTD_SUPPORT=1
INSTALL_PREFIX=${out}
{% endblock %}

{% block cpp_missing %}
unistd.h
pthread.h
{% endblock %}
