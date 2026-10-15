{% extends '//die/c/cmake.sh' %}

{% block version %}
133
{% endblock %}

{% block pkg_name %}
binaryen
{% endblock %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_{{self.version().strip()}}.tar.gz
2f3e3d9edc56751499571da073a8a81943ca3fcbc08a945d2c619a7a1d4eb88b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
{% if linux %}
bin/muslstack
{% endif %}
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
ENABLE_WERROR=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
{% if linux %}
{# binaryen's passes recurse deep in worker threads; musl's default thread
   stack overflows on a module the size of ImageMagick #}
for x in ${out}/bin/wasm-*; do
    muslstack -s 8388608 ${x}
done
{% endif %}
{% endblock %}
