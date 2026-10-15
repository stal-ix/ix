{# SIMDe, SIMD Everywhere: header-only portable implementations of the
   SIMD intrinsics of one ISA (x86, NEON, wasm simd128, ...) over whatever
   the target has, plain C where it has nothing. The C wasm2c generates for
   a module with v128 includes <simde/wasm/simd128.h> from it; wabt vendors
   this same release and installs nothing of it #}

{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
simde
{% endblock %}

{% block version %}
0.8.2
{% endblock %}

{% block fetch %}
https://github.com/simd-everywhere/simde/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ed2a3268658f2f2a9b5367628a85ccd4cf9516460ed8604eed369653d49b25fb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
mkdir -p ${out}/include
cp -R simde ${out}/include/
{% endblock %}
