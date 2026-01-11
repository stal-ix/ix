{% extends '//die/c/cmake.sh' %}

{% block task_pool %}full{% endblock %}

{% block pkg_name %}
DirectXShaderCompiler
{% endblock %}

{% block version %}
1.8.2505.1
{% endblock %}

{% block git_repo %}
https://github.com/microsoft/DirectXShaderCompiler
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
6f9e1167acf329a46ac692f7aece8bca0c98568965bd5ad7e18109d5133b0d9a
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
