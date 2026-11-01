{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-Cross
{% endblock %}

{% block version %}
1.4.363.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
f708982e88b763ef5b0394ed468fc2c3628f68cdab89f2e7a946cd628c04e721
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=spirv-cross-c-shared,pkg_ver={{self.version().strip()}})
{% endblock %}
