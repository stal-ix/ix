{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.1.2
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ccf48cd50c3441c5eee23351ffbf1264bc246e2ce94c953e4440747d7b74877e
{% endblock %}
