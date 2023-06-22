{% extends '//lib/llvm/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/16/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
{% if linux %}
lib/kernel
lib/shim/alloc
{% endif %}
{% endblock %}

{% block cmake_flags %}
{{super()}}

LIBCXX_ENABLE_SHARED=OFF
LIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=OFF
LIBCXX_ENABLE_EXCEPTIONS=OFF
LIBCXX_ENABLE_FILESYSTEM=OFF
LIBCXX_CXX_ABI=libcxxabi
LIBCXX_HAS_MUSL_LIBC=ON
LIBCXX_ABI_VERSION=2

LIBCXXABI_ENABLE_EXCEPTIONS=OFF
LIBCXXABI_ENABLE_SHARED=OFF
LIBCXXABI_SILENT_TERMINATE=ON
LIBCXXABI_ENABLE_PIC=OFF

LLVM_ENABLE_RUNTIMES="libcxx;libcxxabi"
{% endblock %}

{% block cmake_srcdir %}
runtimes
{% endblock %}

{% block ninja_targets %}
cxx
cxxabi
{% endblock %}

{% block ninja_install_targets %}
install-cxx
install-cxxabi
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup %}
export CPPFLAGS="-isystem ${PWD}/clang/lib/Headers ${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv include/c++/v1/* include/
{% endblock %}
