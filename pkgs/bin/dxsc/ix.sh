{% extends '//die/c/cmake.sh' %}

{% block task_pool %}full{% endblock %}

{% block pkg_name %}
DirectXShaderCompiler
{% endblock %}

{% block version %}
1.8.2505
{% endblock %}

{% block git_repo %}
https://github.com/microsoft/DirectXShaderCompiler
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
69e251710023c80d990780480fe8667aa8e5da71e0cca9acf08273e6b9664f42
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
