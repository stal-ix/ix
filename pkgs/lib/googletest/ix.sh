{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/release-1.12.0.tar.gz
sha:2a4f11dce6188b256f3650061525d0fe352069e5c162452818efbbf8d0b5fe1c
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
