{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/plougher/squashfs-tools/archive/refs/tags/4.5.1.tar.gz
sha:277b6e7f75a4a57f72191295ae62766a10d627a4f5e5f19eadfbc861378deea7
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
