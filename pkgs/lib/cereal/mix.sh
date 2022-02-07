{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/USCiLab/cereal/archive/refs/tags/v1.3.1.tar.gz
sha:65ea6ddda98f4274f5c10fb3e07b2269ccdd1e5cbb227be6a2fd78b8f382c976
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
SKIP_PORTABILITY_TEST=ON
SKIP_PERFORMANCE_COMPARISON=ON
JUST_INSTALL_CEREAL=ON
{% endblock %}
