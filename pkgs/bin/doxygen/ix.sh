{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_9_6.tar.gz
sha:2a3ee47f7276b759f74bac7614c05a1296a5b028d3f6a79a88e4c213db78e7dc
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{% endblock %}
