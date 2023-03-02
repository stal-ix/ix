{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.1.7.tar.gz
sha:bff1fa140f4af0e7f02c6cb78d41b9a7d5508e6bcdfda3a583e35460eb6d4b47
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
