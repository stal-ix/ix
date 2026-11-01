{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
squashfuse
{% endblock %}

{% block version %}
0.6.5
{% endblock %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/refs/tags/{{self.version().strip()}}.tar.gz
d7c324bd320c4e36de72b2b9db1d5c04c7c04ec57b03c29c7a4870e1ec58a018
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
{% endblock %}
