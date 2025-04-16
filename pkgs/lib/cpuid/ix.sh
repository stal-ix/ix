{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcpuid
{% endblock %}

{% block version %}
0.7.1
{% endblock %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:c54879ea33b68a2e752c20fb0e3cd04439a9177eab23371f709f15a45df43644
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
