{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ivmai/bdwgc/archive/742febb2f662a45b69bc0c5faef2111d576694fd.zip
sha:b6065d4c6c80a04655894441321f182cb7b1d7fdfb3247f21f866a568468642c
{% endblock %}

{% block lib_deps %}
lib/c
lib/atomicops
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block env %}
export COFLAGS="--with-libgc-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block cmake_flags %}
build_tests=OFF
enable_docs=OFF
enable_threads=ON
enable_large_config=ON
enable_dynamic_loading=OFF
with_libatomic_ops=ON
{% endblock %}
