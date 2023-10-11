{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v0.6.4.tar.gz
sha:5f0114ad4bf01dc3ef4c1fea6fe1839546f592e6517d65ea8be9a8c2a925fd14
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
