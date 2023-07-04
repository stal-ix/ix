{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ivmai/bdwgc/archive/refs/tags/v8.2.4.tar.gz
sha:18e63ab1428bd52e691da107a6a56651c161210b11fbe22e2aa3c31f7fa00ca5
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
build_tests=OFF
enable_docs=OFF
enable_threads=ON
enable_large_config=ON
enable_dynamic_loading=OFF
with_libatomic_ops=ON
{% endblock %}
