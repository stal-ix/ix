{% extends '//die/c/cmake.sh' %}

{% block version %}
2024.04.23
{% endblock %}

{% block pkg_name %}
vcpkg-tool
{% endblock %}

{% block fetch %}
https://github.com/microsoft/vcpkg-tool/archive/refs/tags/{{self.version().strip().replace('.', '-')}}.tar.gz
sha:3c00c274ed097b844b1a675486c61814eacc5c317a42dd93facf3a04e5583c72
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
