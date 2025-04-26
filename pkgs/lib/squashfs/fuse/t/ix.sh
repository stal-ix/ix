{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
squashfuse
{% endblock %}

{% block version %}
0.6.1
{% endblock %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:7730066d1e9baf0084c71674d168331296921e0d7ae0f34de7307744be4ed568
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
{% endblock %}
