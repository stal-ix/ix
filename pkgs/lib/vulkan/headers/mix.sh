{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.3.207.tar.gz
sha:e1fd80fa34e24767ce06690c8f6ba39545dd0c318b11b931bd4faf3fbcc34dd1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
