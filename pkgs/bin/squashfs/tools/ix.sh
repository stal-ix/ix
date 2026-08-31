{% extends '//die/c/make.sh' %}

{% block pkg_name %}
squashfs-tools
{% endblock %}

{% block version %}
4.7.5
{% endblock %}

{% block fetch %}
https://github.com/plougher/squashfs-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
547b7b7f4d2e44bf91b6fc554664850c69563701deab9fd9cd7e21f694c88ea6
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
