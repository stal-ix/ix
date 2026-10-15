{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.4.4
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4f6917fcdbd07517917acff9e9ce20d597a6477bdab1aab00210790620b17848
{% endblock %}
