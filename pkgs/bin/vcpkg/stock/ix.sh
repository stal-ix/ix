{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/vcpkg-tool/archive/refs/tags/2024-01-11.tar.gz
sha:36590cb374eec56e3cc6ec49a3afdda0ece1afb81011a06c8c52da3fd017f8a1
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
