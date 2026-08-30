{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
thinkfan
{% endblock %}

{% block version %}
2.0.0
{% endblock %}

{% block fetch %}
https://github.com/vmatare/thinkfan/archive/refs/tags/{{self.version().strip()}}.tar.gz
0fc94eb378dcba8c889e91f41dab3a8d6eebc7324a59a0704cc39aa66551987e
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/sensors
lib/yaml/cpp
lib/shim/fake/pkg(pkg_name=yaml-cpp,pkg_ver=100500)
{% endblock %}
