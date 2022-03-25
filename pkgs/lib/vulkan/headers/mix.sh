{% extends '//mix/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.3.207.tar.gz
#sha:e1fd80fa34e24767ce06690c8f6ba39545dd0c318b11b931bd4faf3fbcc34dd1
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.2.201.tar.gz
sha:6b7f9c809acff4f0877e2e7722e02a08f2e17e06c6e2e8c84081631d15490009
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): check it'
{% endblock %}
