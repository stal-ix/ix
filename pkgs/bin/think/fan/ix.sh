{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/vmatare/thinkfan/archive/refs/tags/1.3.1.tar.gz
sha:9466c8c82b7c4333b280fa66445ab26185ffbb4aada6bcb4a164eed742f8d78c
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/sensors
lib/yaml/cpp
lib/shim/fake/pkg(pkg_name=yaml-cpp,pkg_ver=100500)
{% endblock %}
