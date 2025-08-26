{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-Cross
{% endblock %}

{% block version %}
1.4.313.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
7d1de24918bea9897753f7561d4d154f68ec89c36bb70c13598222b8039d4212
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=spirv-cross-c-shared,pkg_ver={{self.version().strip()}})
{% endblock %}
