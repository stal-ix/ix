{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.4.5
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ae0619a14240d5685c2fc81475a38b45e2bd4efeb594c928d9e635185f3c6338
{% endblock %}
