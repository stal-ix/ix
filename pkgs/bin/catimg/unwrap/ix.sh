{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/posva/catimg/archive/refs/tags/2.7.0.tar.gz
sha:3a6450316ff62fb07c3facb47ea208bf98f62abd02783e88c56f2a6508035139
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
