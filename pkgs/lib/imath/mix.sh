{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.1.5.tar.gz
sha:1e9c7c94797cf7b7e61908aed1f80a331088cc7d8873318f70376e4aed5f25fb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
