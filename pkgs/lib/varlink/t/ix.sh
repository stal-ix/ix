{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libvarlink
{% endblock %}

{% block version %}
24.0.1
{% endblock %}

{% block fetch %}
https://github.com/varlink/libvarlink/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ca3ecd13005309e0322bc64a26f2960e613f2a9a9cedee845865c2d042f73b3c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
