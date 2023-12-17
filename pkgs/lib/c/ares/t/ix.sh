{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/cares-1_24_0.tar.gz
sha:359e500473ce498169fd3469638c3e9b2e47474148d68059ecaadaf35c14b71b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}
