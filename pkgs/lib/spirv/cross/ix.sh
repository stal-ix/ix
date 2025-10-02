{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-Cross
{% endblock %}

{% block version %}
1.4.321.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
6037555620c27105bf1d4068a6eeb4b0d7953630d556a1ca9799dfe06fd2fb68
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=spirv-cross-c-shared,pkg_ver={{self.version().strip()}})
{% endblock %}
