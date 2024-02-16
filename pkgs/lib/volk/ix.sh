{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-1.3.275.0.tar.gz
sha:b68d24e139190e49e5eafd72894f6e85c80472b8745bddc6ef91d6bf339df813
{% endblock %}

{% block lib_deps %}
lib/c
lib/vulkan/headers
{% endblock %}

{% block cmake_flags %}
VOLK_INSTALL=ON
{% endblock %}
