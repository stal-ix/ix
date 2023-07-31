{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/0.4.0.tar.gz
sha:bddbfeed1b50e795a4a466b2977617e48904108e261d64563234e98ea2cd2f19
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
