{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ivmai/libatomic_ops/archive/refs/tags/v7.8.0.tar.gz
sha:68c5970b11297056c8e5c63a73f26621a8eb8c667a5fe9a2b3e3ff6c0fbb3177
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block cmake_flags %}
enable_docs=OFF
{% endblock %}
