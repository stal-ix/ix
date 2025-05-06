{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.0.2
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1b2e4785487c2e9e2cba161c8de03e4a604d53543ba3c4dd8d5e938c75c159af
{% endblock %}
