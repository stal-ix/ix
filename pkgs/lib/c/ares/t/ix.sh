{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/cares-1_25_0.tar.gz
sha:57549b266748ec22fa5706897c1e0f5a39b54b517362e3c774942bb2b7d15fb4
{% endblock %}

{% block lib_deps %}
lib/c
{% if mingw32 %}
lib/shim/dll(dll_name=iphlpapi)
{% endif %}
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}
