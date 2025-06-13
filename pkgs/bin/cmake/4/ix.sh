{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.0.3
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:caff19e6f55dc6de04fc47978cda88a44be3b439faf489d0876265adf9242e49
{% endblock %}
