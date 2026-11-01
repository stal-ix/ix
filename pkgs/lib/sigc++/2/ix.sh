{% extends '//die/c/meson.sh' %}

# noauto

{% block pkg_name %}
libsigc++
{% endblock %}

{% block version %}
2.12.2
{% endblock %}

{% block fetch %}
https://github.com/libsigcplusplus/libsigcplusplus/releases/download/{{self.version().strip()}}/libsigc%2B%2B-{{self.version().strip()}}.tar.xz
7d4cdf1e4332ebfee8085ad960075045e7763cb291b3ccf4744d7cbf08a22b75
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
