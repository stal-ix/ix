{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/mheily/libkqueue/archive/refs/tags/v2.6.1.tar.gz
sha:666e26b8c2fb597fc686534bd8eb6c3733ce6d0750bf13f0323c95040ca6cb92
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
lib/bsd/overlay
{% endblock %}

{% block cmake_flags %}
STATIC_KQUEUE=ON
{% endblock %}
