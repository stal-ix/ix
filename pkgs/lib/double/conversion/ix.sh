{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
double-conversion
{% endblock %}

{% block version %}
3.3.1
{% endblock %}

{% block fetch %}
https://github.com/google/double-conversion/archive/refs/tags/v{{self.version().strip()}}.tar.gz
fe54901055c71302dcdc5c3ccbe265a6c191978f3761ce1414d0895d6b0ea90e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
