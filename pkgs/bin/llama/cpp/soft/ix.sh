{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
llama.cpp
{% endblock %}

{% block version %}
b7086
{% endblock %}

{% block fetch %}
https://github.com/ggml-org/llama.cpp/archive/refs/tags/{{self.version().strip()}}.tar.gz
166c7135ba5cc43b2b650b5b7d49059778757ff09b5dc12358910aa5712ccf00
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/kernel
{% endblock %}

{% block cmake_flags %}
GGML_BACKEND_DL=OFF
LLAMA_BUILD_TESTS=OFF
LLAMA_BUILD_EXAMPLES=OFF
{% endblock %}
