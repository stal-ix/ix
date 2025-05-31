{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tracy
{% endblock %}

{% block version %}
0.12.0
{% endblock %}

{% block fetch %}
https://github.com/wolfpld/tracy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ce2fb5b89aeb6db8401d7efe1bfe8393b7a81ca551273e8c6dd46ed37c02a040
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
