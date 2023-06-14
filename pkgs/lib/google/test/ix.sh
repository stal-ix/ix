{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/v1.13.0.tar.gz
sha:ad7fdba11ea011c1d925b3289cf4af2c66a352e18d4c7264392fead75e919363
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
