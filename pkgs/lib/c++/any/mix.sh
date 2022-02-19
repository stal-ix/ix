{% extends '//lib/llvm/t/mix.sh' %}

{% block fetch %}
{% include '//lib/llvm/14/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block cmake_flags %}
{{super()}}

LIBCXXABI_ENABLE_SHARED=NO
LIBCXXABI_ENABLE_STATIC=YES

LIBUNWIND_ENABLE_SHARED=NO
LIBUNWIND_ENABLE_STATIC=YES

LIBCXX_ENABLE_SHARED=NO
LIBCXX_ENABLE_STATIC=YES
LIBCXX_CXX_ABI=libcxxabi
LIBCXX_USE_COMPILER_RT=NO

# be like Google
LIBCXX_ABI_VERSION=999
LIBCXX_ABI_NAMESPACE=__1
LIBCXX_ABI_UNSTABLE=ON

LLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind"
{% endblock %}

{% block cmake_srcdir %}
runtimes
{% endblock %}

{% block ninja_targets %}
cxx
cxxabi
unwind
{% endblock %}

{% block ninja_install_targets %}
install-cxx
install-cxxabi
install-unwind
{% endblock %}

{% block cpp_defines %}
_LIBUNWIND_USE_DLADDR=0
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_includes %}
${PWD}/libunwind/include
{% endblock %}

{% block setup %}
export CPPFLAGS="-isystem ${PWD}/clang/lib/Headers ${CPPFLAGS}"
{% endblock %}

{% block patch %}
{{super()}}

cat libcxx/CMakeLists.txt \
    | grep -v 'is reserved for use by libc' \
    > _ && mv _ libcxx/CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
cd ${out}

mv include/c++/v1/* include/

# remove broken ranges implementation
rm include/ranges
{% endblock %}

{% block test_lib %}
cat ${out}/include/__config_site | grep LIBCPP_ABI
{% endblock %}
