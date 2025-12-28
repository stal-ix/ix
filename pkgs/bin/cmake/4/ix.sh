{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.2.1
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5c766b507cc2ac26c16dda856f9943a8dd6a8b23b49d1c00619946ac9d8e6ea3
{% endblock %}
