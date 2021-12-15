{% extends '//lib/llvm/t/mix.sh' %}

{% block lib_deps %}
lib/c/naked/mix.sh
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block cmake_flags %}
{{super()}}

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

{% block patch %}
{{super()}}

cat libcxx/CMakeLists.txt \
    | grep -v 'is reserved for use by libc' \
    > _ && mv _ libcxx/CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
cd ${out} && mv include/c++/v1/* include/
{% endblock %}

{% block test %}
cat ${out}/include/__config_site | grep LIBCPP_ABI
{% endblock %}
