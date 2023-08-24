{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-1.2.3.tar.gz
sha:85057f788630dc1b8c371f5443cc192627175003a8ea63c491beaff29a338346
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
