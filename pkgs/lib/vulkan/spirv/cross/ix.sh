{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-1.3.296.0.tar.gz
sha:4f7f9a8a643e6694f155712016b9b572c13a9444e65b3f43b27bb464c0ab76e0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
