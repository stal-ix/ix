{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
oniguruma
{% endblock %}

{% block version %}
6.9.9
{% endblock %}

{% block fetch %}
https://github.com/kkos/oniguruma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:001aa1202e78448f4c0bf1a48c76e556876b36f16d92ce3207eccfd61d99f2a0
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
