{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Esri/lerc/archive/refs/tags/js_v4.0.4.tar.gz
sha:1dc090218387ab8ca615eefd844207be64454e37868b396f3e965ed0dcf83947
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cpp_missing %}
limits.h
{% endblock %}
