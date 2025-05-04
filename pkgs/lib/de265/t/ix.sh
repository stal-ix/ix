{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libde265
{% endblock %}

{% block version %}
1.0.16
{% endblock %}

{% block fetch %}
https://github.com/strukturag/libde265/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ed12c931759c1575848832f70db5071a001ac813db4e4f568ee08aef6e234d4e
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
