{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ivmai/bdwgc/archive/refs/tags/v8.2.6.tar.gz
sha:3bfc2b1dd385bfb46d2dab029211a66249a309795b6893f4e00554904999e40a
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
