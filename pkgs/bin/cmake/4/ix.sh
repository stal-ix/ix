{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.2.0
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e388fa866bc099d7e1f2b51f1aa3f7fe1a61fba08eefe6a10e031bb85bed8467
{% endblock %}
