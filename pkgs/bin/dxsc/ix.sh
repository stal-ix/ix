{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/DirectXShaderCompiler
{% endblock %}

{% block git_branch %}
v1.7.2308
{% endblock %}

{% block git_sha %}
f51d755aa3ab8ea0ba3af963dee148d4086b2b57c5309c3d94a53cb7e3fb4743
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
