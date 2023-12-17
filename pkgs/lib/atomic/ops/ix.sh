{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ivmai/libatomic_ops/archive/refs/tags/v7.8.2.tar.gz
sha:ad8428a40e01d41bc4ddad3166afa1fc175c9e58d8ef7ddbd7ef3298e32ac37b
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block cmake_flags %}
enable_docs=OFF
{% endblock %}
