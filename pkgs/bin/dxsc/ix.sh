{% extends '//die/c/cmake.sh' %}

{% block task_pool %}full{% endblock %}

{% block pkg_name %}
DirectXShaderCompiler
{% endblock %}

{% block version %}
1.10.2605.37
{% endblock %}

{% block git_repo %}
https://github.com/microsoft/DirectXShaderCompiler
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
4866ff12768f5ecc9b1af92259c4045cbe80deb84e1cd24e9a4642d0ee96b7f2
{% endblock %}

{% block git_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
bin/dxsc/dll
lib/execinfo
{% endblock %}

{% block bins %}
dxa-3.7
dxc-3.7
dxl-3.7
dxr-3.7
dxv-3.7
dxopt-3.7
{% endblock %}

{% block bld_tool %}
bld/python
bld/fake/error(tool_name=git)
bld/wrap/cc/plugins/unreg(bins={{self.bins() | parse_list | fjoin(';')}})
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
wrap_rdynamic
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
