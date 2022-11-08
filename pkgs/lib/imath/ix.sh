{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.1.6.tar.gz
sha:ea5592230f5ab917bea3ceab266cf38eb4aa4a523078d46eac0f5a89c52304db
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
