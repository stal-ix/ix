{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/vcpkg-tool/archive/refs/tags/2024-02-05.tar.gz
sha:b816b7f49e8277ea7bb34ec836f7c24d6364e25cc9c1a128f84084d96d2760ad
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
