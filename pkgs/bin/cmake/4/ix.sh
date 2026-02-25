{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.2.3
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
803186734800e1e8b2a242154ba1ed7bda4e77643e77e12477c71f3cdc7ede1d
{% endblock %}
