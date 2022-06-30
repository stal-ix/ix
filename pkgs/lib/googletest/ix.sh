{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/release-1.12.1.tar.gz
sha:81964fe578e9bd7c94dfdb09c8e4d6e6759e19967e397dbea48d1c10e45d0df2
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
