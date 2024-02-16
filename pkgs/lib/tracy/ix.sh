{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/wolfpld/tracy/archive/refs/tags/v0.10.tar.gz
sha:a76017d928f3f2727540fb950edd3b736caa97b12dbb4e5edce66542cbea6600
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
