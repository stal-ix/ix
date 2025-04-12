{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cereal
{% endblock %}

{% block version %}
1.3.2
{% endblock %}

{% block fetch %}
https://github.com/USCiLab/cereal/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:16a7ad9b31ba5880dac55d62b5d6f243c3ebc8d46a3514149e56b5e7ea81f85f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_DOC=OFF
BUILD_SANDBOX=OFF
SKIP_PERFORMANCE_COMPARISON=ON
JUST_INSTALL_CEREAL=ON
WITH_WERROR=OFF
{% endblock %}
