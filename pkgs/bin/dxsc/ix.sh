{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/DirectXShaderCompiler
{% endblock %}

{% block git_branch %}
v1.7.2308
{% endblock %}

{% block git_sha %}
728f4dd5a2209f3235abddae6189fce7a6cd955f4c3205093827af2e331d6c39
{% endblock %}

{% block git_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/curses
lib/execinfo
{% endblock %}

{% block bld_tool %}
bld/python
bld/fake/error(tool_name=git)
{% endblock %}

{% block cmake_extra_flags %}
-C
${PWD}/cmake/caches/PredefinedParams.cmake
{% endblock %}

{% block cpp_missing %}
sys/types.h
{% endblock %}

{% block cmake_flags %}
HLSL_INCLUDE_TESTS=OFF
LLVM_INCLUDE_TESTS=OFF
{% endblock %}

{% block build %}
{{super()}}
>${tmp}/obj/bin/llvm-as
>${tmp}/obj/bin/llvm-dis
{% endblock %}
