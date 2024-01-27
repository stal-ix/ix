{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.1.10.tar.gz
sha:f2943e86bfb694e216c60b9a169e5356f8a90f18fbd34d7b6e3450be14f60b10
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
