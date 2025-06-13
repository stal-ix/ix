{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
olm
{% endblock %}

{% block version %}
3.2.16
{% endblock %}

{% block fetch %}
https://gitlab.matrix.org/matrix-org/olm/-/archive/{{self.version().strip()}}/olm-{{self.version().strip()}}.tar.bz2
327cfcb81ef0c42f4b1d5c24b25d56932b57d64ccd9f00ed919a893a43333411
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
