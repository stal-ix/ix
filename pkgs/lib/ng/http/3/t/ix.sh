{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/archive/refs/tags/v1.0.0.tar.gz
sha:838def499e368b24d8a4656ad9a1f38bb7ca8b2857a44c5de1c006420cc0bbee
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=OFF
{% endblock %}
