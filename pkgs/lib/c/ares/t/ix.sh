{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/cares-1_18_1.tar.gz
sha:414872549eec4e221b576693fdc9c9bce44ff794d0f1f06f2515b56a7f6ec9c9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}
