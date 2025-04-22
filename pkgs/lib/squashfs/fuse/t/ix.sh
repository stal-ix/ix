{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
squashfuse
{% endblock %}

{% block version %}
0.6.0
{% endblock %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:fee364242fb4eea72e082ec674b6e6661856408a06719e1e88ce8673a22dc78a
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
{% endblock %}
