{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/vcpkg-tool/archive/refs/tags/2024-02-07.tar.gz
sha:e4a659e447f73c988cd3e268a88f31fe402037977ecf60cdbec67d4411df08c8
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
