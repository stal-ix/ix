{% extends '//die/c/make.sh' %}

{% block pkg_name %}
squashfs-tools
{% endblock %}

{% block version %}
4.7
{% endblock %}

{% block fetch %}
https://github.com/plougher/squashfs-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
f1605ef720aa0b23939a49ef4491f6e734333ccc4bda4324d330da647e105328
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
