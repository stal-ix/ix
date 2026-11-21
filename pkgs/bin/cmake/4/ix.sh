{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.5.1
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
eef5bb9bf924c53eeca8b40b537cb45e3505b358bfeb65e5d628fbfabcda178f
{% endblock %}
