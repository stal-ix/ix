{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.2.201.tar.gz
bb83fbcd393bfa6f3b83d2ce7ce987ed
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
