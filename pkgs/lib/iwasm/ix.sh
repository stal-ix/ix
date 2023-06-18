{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-1.2.2.tar.gz
sha:d328fc1e19c54cfdb4248b861de54b62977b9b85c0a40eaaeb9cd9b628c0c788
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
