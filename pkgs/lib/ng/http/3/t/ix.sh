{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
nghttp3
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v{{self.version().strip()}}/nghttp3-{{self.version().strip()}}.tar.xz
6ca1e523b7edd75c02502f2bcf961125c25577e29405479016589c5da48fc43d
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

{% block cpp_defines %}
{{super()}}
NGHTTP3_STATICLIB=1
{% endblock %}
