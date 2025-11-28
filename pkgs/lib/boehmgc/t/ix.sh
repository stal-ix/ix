{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
bdwgc
{% endblock %}

{% block version %}
8.2.10
{% endblock %}

{% block fetch %}
https://github.com/ivmai/bdwgc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5858a417ab3eaac2add0daf79cd29ddf248c9f648e6c08092b775dcbfcbe1edb
{% endblock %}

{% block lib_deps %}
lib/c
lib/atomic/ops
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block env %}
export COFLAGS="--with-libgc-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|REAL_DLFUNC(dlopen)|stub_dlopen|' -i gc_dlopen.c
{% endblock %}

{% block cmake_flags %}
HAVE_GETCONTEXT=OFF
build_tests=OFF
enable_docs=OFF
enable_threads=ON
enable_large_config=ON
enable_dynamic_loading=OFF
with_libatomic_ops=ON
{% endblock %}

{% block cpp_defines %}
USE_PROG_DATA_START=1
{% endblock %}
