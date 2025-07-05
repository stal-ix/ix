{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libtsm
{% endblock %}

{% block version %}
4.1.0
{% endblock %}

{% block fetch %}
https://github.com/Aetf/libtsm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
879a166a07aed63146ffe3e2afe803c0c3e22f264db0f1fa6fdb44687adeeef8
{% endblock %}

{% block lib_deps %}
lib/c
lib/xkb/common
{% endblock %}

{% block cpp_defines %}
static_assert=_Static_assert
{% endblock %}
