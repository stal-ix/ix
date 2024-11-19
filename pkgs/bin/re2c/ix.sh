{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/4.0.tar.gz
sha:61074bb053c6e76c21cd5c0171c9b15b487db2a2eb3401b873b24839aba13c94
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block std_box %}
{{super()}}
bld/python
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
