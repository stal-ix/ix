{% extends '//mix/template/cmake.sh' %}

{% block bld_deps %}
{{'lib/linux/mix.sh' | linux}}
env/std/0/mix.sh
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
-DLIBCXX_USE_COMPILER_RT=yes
{% if mix.platform.target.os == 'linux' %}
-DLIBCXX_HAS_MUSL_LIBC=yes
{% endif %}

-DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind"
{% endblock %}

{% block cmdir %}
../runtimes
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

{% block env %}
export CPPFLAGS="-I${out}/include/c++/v1 \${CPPFLAGS}"
{% endblock %}
