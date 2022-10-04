{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/0.1.105.tar.gz
sha:3f776892ab2044ecca417be348e482fee2839db75e35d165b53737cb8153ab1e
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
lib/fuse/3
{% endblock %}
