{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/cares-1_21_0.tar.gz
sha:ca92c84b3df3dc78ed0a5f32de5589e06469ca1c1af7b5a6d8e5e970b53ab5fd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}
