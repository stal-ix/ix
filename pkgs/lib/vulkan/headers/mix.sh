{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/sdk-1.3.204.1.tar.gz
sha:9c4d33f71467c915749fbf48c0c3a8ee7833f15babf398e3463cd88791fb592e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): check it'
{% endblock %}
