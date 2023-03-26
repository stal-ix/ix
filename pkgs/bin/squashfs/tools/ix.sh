{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/plougher/squashfs-tools/archive/refs/tags/4.6.1.tar.gz
sha:94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c
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
