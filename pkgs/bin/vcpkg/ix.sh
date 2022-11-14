{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/vcpkg-tool/archive/refs/tags/2022-11-10.tar.gz
sha:627ff5da84e7464a68e154f3903484f9f063cc5141d5e5a9fa250b519be93c6d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/curl
lib/cmrc
{% endblock %}

{% block cmake_flags %}
VCPKG_DEPENDENCY_CMAKERC=ON
VCPKG_DEPENDENCY_EXTERNAL_FMT=ON
{% endblock %}
