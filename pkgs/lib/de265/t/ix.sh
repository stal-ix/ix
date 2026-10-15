{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libde265
{% endblock %}

{% block version %}
1.1.3
{% endblock %}

{% block fetch %}
https://github.com/strukturag/libde265/archive/refs/tags/v{{self.version().strip()}}.tar.gz
189baa08fd6d2dd34db099de411bd6b2e6bd5eb88e81236a3d0fa3826b9715c4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block cmake_flags %}
{% if not x86_64 %}
DISABLE_SSE=ON
{% endif %}
{% endblock %}
