{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
squashfuse
{% endblock %}

{% block version %}
0.6.3
{% endblock %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/{{self.version().strip()}}.tar.gz
4fda456c0f28f64db7e97f259069e747ffe29dcd13d4e2327350997b32eac914
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
{% endblock %}
