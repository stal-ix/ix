{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
yyjson
{% endblock %}

{% block version %}
0.12.0
{% endblock %}

{% block fetch %}
https://github.com/ibireme/yyjson/archive/refs/tags/{{self.version().strip()}}.tar.gz
b16246f617b2a136c78d73e5e2647c6f1de1313e46678062985bdcf1f40bb75d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
