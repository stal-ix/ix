{% extends '//die/c/cmake.sh' %}

{% block version %}
2.1.1
{% endblock %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-{{self.version().strip()}}.tar.gz
sha:04daaa934ca5bd1972432dd353b9d04a046c2d956fc923b01f74fe6af6f44f4b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
