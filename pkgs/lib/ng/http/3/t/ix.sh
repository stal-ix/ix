{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v1.4.0/nghttp3-1.4.0.tar.xz
sha:c87b27ef33982a3b831dd349f4a75c55bd4c22a8ec0890095b84b54009df9d6a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=ON
ENABLE_SHARED_LIB=OFF
{% endblock %}
