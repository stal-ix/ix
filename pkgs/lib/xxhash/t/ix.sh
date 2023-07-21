{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.2.tar.gz
sha:baee0c6afd4f03165de7a4e67988d16f0f2b257b51d0e3cb91909302a26a79c4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
