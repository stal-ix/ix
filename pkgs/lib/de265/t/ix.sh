{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libde265/archive/refs/tags/v1.0.10.tar.gz
sha:534f21f7440297f3a687d927edc9bb11b44e0155f3a29c29adc79ffb1e55478d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}
