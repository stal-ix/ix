{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wabt
{% endblock %}

{% block version %}
1.0.42
{% endblock %}

{% block git_repo %}
https://github.com/WebAssembly/wabt
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
bfff3c1447a15d61a25af2cec1bfc5c0165b388698570616fed88f5edf0ae50b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
USE_SYSTEM_GTEST=ON
{% endblock %}

{# a bin package keeps no include/: the wasm2c runtime's public headers go
   with the runtime's sources, which lib/wabt/runtime builds into a library #}
{% block install %}
{{super()}}
mv ${out}/include/wasm-rt*.h ${out}/share/wabt/wasm2c/
{% endblock %}

{% block env %}
export WABT_WASM2C_RUNTIME="${out}/share/wabt/wasm2c"
{% endblock %}
