{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.1.0
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c4767f9d3227370b6ab4300a650d975a24e0f447bb81a33aef31fa2341a434cf
{% endblock %}
