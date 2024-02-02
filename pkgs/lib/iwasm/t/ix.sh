{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-1.3.2.tar.gz
sha:58961ba387ed66ace2dd903597f1670a42b8154a409757ae6f06f43fe867a98c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
