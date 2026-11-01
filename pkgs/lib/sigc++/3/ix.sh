{% extends '//die/c/meson.sh' %}

# noauto

{% block pkg_name %}
libsigc++
{% endblock %}

{% block version %}
3.8.1
{% endblock %}

{% block fetch %}
https://github.com/libsigcplusplus/libsigcplusplus/releases/download/{{self.version().strip()}}/libsigc%2B%2B-{{self.version().strip()}}.tar.xz
4ff41d1474e501d3baeced4c989d154338206ac16471e614376496b63fe252d1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
