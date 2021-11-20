{% extends '//mix/template/cmake.sh' %}

{% block lib_deps %}
lib/c/naked/mix.sh
{% endblock %}

{% block bld_libs %}
{{'lib/linux/mix.sh' | linux}}
{% endblock %}

{% block std_env %}
env/std/1/mix.sh
{% endblock %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block cmflags %}
-DLIBCXXABI_ENABLE_SHARED=NO
-DLIBCXXABI_ENABLE_STATIC=YES

-DLIBUNWIND_ENABLE_SHARED=NO
-DLIBUNWIND_ENABLE_STATIC=YES

-DLIBCXX_ENABLE_SHARED=NO
-DLIBCXX_ENABLE_STATIC=YES
-DLIBCXX_CXX_ABI=libcxxabi
-DLIBCXX_USE_COMPILER_RT=NO

# be like Google
-DLIBCXX_ABI_VERSION=999
-DLIBCXX_ABI_NAMESPACE=__1
-DLIBCXX_ABI_UNSTABLE=ON

-DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind"
{% endblock %}

{% block cmdir %}
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

{% block patch %}
cat libcxx/CMakeLists.txt | grep -v 'is reserved for use by libc' > _ && mv _ libcxx/CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
cd ${out} && mv include/c++/v1/* include/
{% endblock %}

{% block test %}
cat ${out}/include/__config_site | grep LIBCPP_ABI
{% endblock %}
