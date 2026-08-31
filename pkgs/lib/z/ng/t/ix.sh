{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
zlib-ng
{% endblock %}

{% block version %}
2.3.3
{% endblock %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/{{self.version().strip()}}.tar.gz
f9c65aa9c852eb8255b636fd9f07ce1c406f061ec19a2e7d508b318ca0c907d1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ZLIB_ENABLE_TESTS=OFF
{% endblock %}
