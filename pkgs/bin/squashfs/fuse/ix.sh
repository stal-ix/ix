{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/0.3.0.tar.gz
sha:cc59722e1c7fafb142146f394eacec20f020330ada848113c2e1fc83ab679c05
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
