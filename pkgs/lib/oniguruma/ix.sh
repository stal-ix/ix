{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
oniguruma
{% endblock %}

{% block version %}
6.9.10
{% endblock %}

{% block fetch %}
https://github.com/kkos/oniguruma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ad92309d0d13eebc27f6592e875f3efbfa3dda2bf6da5952e00f0a2120c921a8
{% endblock %}

{% block env %}
export COFLAGS="--with-onig=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
INSTALL_DOCUMENTATION=OFF
{% endblock %}
