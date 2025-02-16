{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/double-conversion/archive/refs/tags/v3.3.1.tar.gz
sha:fe54901055c71302dcdc5c3ccbe265a6c191978f3761ce1414d0895d6b0ea90e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
