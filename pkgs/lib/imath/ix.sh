{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.1.11.tar.gz
9057849585e49b8b85abe7cc1e76e22963b01bfdc3b6d83eac90c499cd760063
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
