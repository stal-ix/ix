{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/v0.5.0.tar.gz
sha:93ef7fc5d359d5a8faf284232bbf351ce5630de4234c9655445803030f7e1bc5
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
