{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.1.9.tar.gz
sha:f1d8aacd46afed958babfced3190d2d3c8209b66da451f556abd6da94c165cf3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
