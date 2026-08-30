{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tracy
{% endblock %}

{% block version %}
0.14.1
{% endblock %}

{% block fetch %}
https://github.com/wolfpld/tracy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bf4af567e9c7524d07f3caa745fad02fb33bd5694f11910750382d1efbb251c1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
>public/client/TracyOverride.cpp
{% endblock %}
