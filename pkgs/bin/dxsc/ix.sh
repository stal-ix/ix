{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/DirectXShaderCompiler
{% endblock %}

{% block git_branch %}
v1.7.2308
{% endblock %}

{% block git_sha %}
f9cc27b4a1dcf11a6b5a370bcece33970c9c5069baa8b610dc14f8286bf1c636
{% endblock %}

{% block git_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/curses
bin/dxsc/dll
lib/execinfo
{% endblock %}

{% block bld_tool %}
bld/python
bin/dxsc/exe
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

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|bool DxilLibIsEnabled|bool DxilLibIsEnabledXXX|' \
    -i tools/clang/tools/dxcompiler/dxillib.cpp
cat << EOF >> tools/clang/tools/dxcompiler/dxillib.cpp
bool DxilLibIsEnabled() {
    return false;
}
EOF
{% endblock %}
