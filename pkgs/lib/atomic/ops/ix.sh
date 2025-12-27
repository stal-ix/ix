{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libatomic_ops
{% endblock %}

{% block version %}
7.10.0
{% endblock %}

{% block fetch %}
https://github.com/ivmai/libatomic_ops/archive/refs/tags/v{{self.version().strip()}}.tar.gz
96443e58a6bb6c0ada61660ccb547254aaa97e44bceb10a340937f6ba3ba8243
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block cmake_flags %}
enable_docs=OFF
{% endblock %}
