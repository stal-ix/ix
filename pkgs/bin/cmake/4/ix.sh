{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.0.1
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:7f6a3783eb636d46c5034fc390178668c245fca23c5885aefde0b7c9bc267e01
{% endblock %}
