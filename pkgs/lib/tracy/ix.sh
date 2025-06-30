{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tracy
{% endblock %}

{% block version %}
0.12.2
{% endblock %}

{% block fetch %}
https://github.com/wolfpld/tracy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
09617765ba5ff1aa6da128d9ba3c608166c5ef05ac28e2bb77f791269d444952
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
