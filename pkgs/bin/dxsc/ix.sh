{% extends '//die/c/cmake.sh' %}

{% block task_pool %}full{% endblock %}

{% block pkg_name %}
DirectXShaderCompiler
{% endblock %}

{% block version %}
1.8.2502
{% endblock %}

{% block git_repo %}
https://github.com/microsoft/DirectXShaderCompiler
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
ed3f9b20e5f851ede3dcec657aacca0af96ffe444771ad8889b09060be0e0c49
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
