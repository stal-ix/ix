{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.1.1
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1184b7351d4711bada3493fa748f6a218f477dc380591a13109adfca8a7cab03
{% endblock %}
