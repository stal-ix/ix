{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v1.9.0.tar.gz
sha:053ada7e22c3735f4f0c7df48aeede11fdb7e64bf5f0db03e56cf215aeb6dc04
{% endblock %}

{% block lib_deps %}
lib/c
lib/ev
lib/ng/http/3
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=OFF
ENABLE_SHARED_LIB=ON
{% endblock %}

{% block patch %}
{{super()}}
>examples/CMakeLists.txt
>third-party/CMakeLists.txt
{% endblock %}

{% block env %}
export COFLAGS="--with-ngtcp2=${out} \${COFLAGS}"
{% endblock %}
