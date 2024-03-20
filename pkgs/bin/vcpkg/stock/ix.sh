{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/vcpkg-tool/archive/refs/tags/2024-03-14.tar.gz
sha:2b89635be4832ced505915bf46bbdd09d8a13ffd4c9ae11754929c7d07f1b903
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
