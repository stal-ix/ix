{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tracy
{% endblock %}

{% block version %}
0.15.0
{% endblock %}

{% block fetch %}
https://github.com/wolfpld/tracy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3d57da54aa67d7875da1e8fecd0bd5957675cef73c27dd52bffb6ab8d290a5e6
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
