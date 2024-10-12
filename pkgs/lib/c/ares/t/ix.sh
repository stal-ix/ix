{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/c-ares/c-ares/archive/refs/tags/v1.33.0.tar.gz
#sha:3ff8f6f74a4f2b9267d06b4ffc1f082918ae8316c7f37c5a52f1a6e7a9694df7
https://github.com/c-ares/c-ares/archive/refs/tags/v1.34.1.tar.gz
sha:732fd9b8e1c51b507f3922fd87ba58d60184d05867714ff40c661397c1464f61
{% endblock %}

{% block lib_deps %}
lib/c
{% if mingw32 %}
lib/shim/dll(dll_name=iphlpapi)
{% endif %}
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}
