{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ivmai/bdwgc/releases/download/v8.2.2/gc-8.2.2.tar.gz
sha:f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0
{% endblock %}

{% block lib_deps %}
lib/c
lib/atomicops
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libgc-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block cmake_flags %}
build_tests=OFF
enable_docs=OFF
enable_threads=ON
enable_cplusplus=OFF
enable_large_config=ON
enable_dynamic_loading=OFF
with_libatomic_ops=ON
{% endblock %}
