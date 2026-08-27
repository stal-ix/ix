{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
highway
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/google/highway/archive/refs/tags/{{self.version().strip()}}.tar.gz
e72241ac9524bb653ae52ced768b508045d4438726a303f10181a38f764a453c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cmake_flags %}
HWY_ENABLE_EXAMPLES=OFF
{% endblock %}
