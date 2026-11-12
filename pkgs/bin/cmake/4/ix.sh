{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.5.0
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
707cd2876cc7cc7e3392a61b1c3b1e3da81472a988a11970272173ea9a896c09
{% endblock %}
