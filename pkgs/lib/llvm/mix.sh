{% extends '//mix/template/cmake.sh' %}

{% block lib_deps %}
lib/c++/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/python/mix.sh
{% endblock %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block patch %}
echo > llvm/unittests/Support/DynamicLibrary/CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
-DLLVM_BUILD_LLVM_DYLIB=OFF
-DLLVM_LINK_LLVM_DYLIB=OFF
-DLLVM_ENABLE_PROJECTS=""
-DLLVM_POLLY_LINK_INTO_TOOLS=ON
-DLLVM_ENABLE_PIC=OFF
-DLLVM_DYLIB_COMPONENTS=''
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}

{% block postinstall %}
# TODO(pg): cross compile
{% endblock %}
