{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-1.3.296.0.tar.gz
sha:635b9b9ed2318df5ac65a0e1db1f92deb1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
