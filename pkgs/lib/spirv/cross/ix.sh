{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-Cross
{% endblock %}

{% block version %}
1.4.357.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/6c09849fe88c48eaed08413aa022aaa136a3a057.tar.gz
b81b9956289950570953738e666a031ca32ff64e4fc925eba89f227c42109518
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=spirv-cross-c-shared,pkg_ver={{self.version().strip()}})
{% endblock %}
