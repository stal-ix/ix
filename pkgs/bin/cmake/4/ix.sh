{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.4.2
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e821bfb902a4f5e47b6e45bdae0a781918043d4b2c5517a023bc99596ae6abaf
{% endblock %}
