{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-1.3.268.0.tar.gz
sha:dd656a51ba4c229c1a0bb220b7470723e8fd4b68abb7f2cf2ca4027df824f4a0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
