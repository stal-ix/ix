{% extends '//die/c/cmake.sh' %}

{% block version %}
3.2.15
{% endblock %}

{% block fetch %}
https://gitlab.matrix.org/matrix-org/olm/-/archive/{{self.version().strip()}}/olm-{{self.version().strip()}}.tar.bz2
sha:543f14f58a5ff7187f62f28afedfeba246fd0f28fccdad259dee82215b91298d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
OLM_TESTS=OFF
{% endblock %}

{% block patch %}
sed -e 's|T \* const other_pos|auto other_pos|' \
    -i include/olm/list.hh
{% endblock %}
