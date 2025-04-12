{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.5.0
{% endblock %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:93ef7fc5d359d5a8faf284232bbf351ce5630de4234c9655445803030f7e1bc5
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
{% endblock %}
