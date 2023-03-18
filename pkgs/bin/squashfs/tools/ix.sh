{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/plougher/squashfs-tools/archive/refs/tags/4.6.tar.gz
sha:afc157495fa90d2042172fc642237afe1956f1a5beb141058bba3256b8d92013
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
