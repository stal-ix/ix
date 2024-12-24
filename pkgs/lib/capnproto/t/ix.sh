{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/capnproto/capnproto/archive/refs/tags/v1.1.0.tar.gz
sha:c0a0d78a07e821f7bae26c7fcac20a9202eb3d639a673b2606b76092a1f35b6b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
