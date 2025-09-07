{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libatomic_ops
{% endblock %}

{% block version %}
7.8.4
{% endblock %}

{% block fetch %}
https://github.com/ivmai/libatomic_ops/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ea8295ac627646e37fd194d31535bbc02da60b908c8166c5e04d2461a53cb059
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block cmake_flags %}
enable_docs=OFF
{% endblock %}
