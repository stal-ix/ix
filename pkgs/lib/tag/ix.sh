{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://taglib.org/releases/taglib-1.13.1.tar.gz
sha:c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
