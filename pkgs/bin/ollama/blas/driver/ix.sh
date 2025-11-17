{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ollama/ollama/archive/refs/tags/v0.12.11.tar.gz
710df5e218a29a2500ed973c81879514b5618df01687373a3467a05f63fe8002
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/openblas
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
GGML_CPU=OFF
GGML_BLAS=ON
GGML_BLAS_VENDOR=OpenBLAS
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${tmp}/obj/lib/ollama/libggml-blas.so ${out}/lib/libggml-blas.a
{% endblock %}
