{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/0.2.0.tar.gz
sha:5f088257e877cd8f5fc1232801b4d412b44a017054953acc11bc16a58462b1b0
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
