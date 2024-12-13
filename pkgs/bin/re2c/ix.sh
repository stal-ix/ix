{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/4.0.2.tar.gz
sha:43f15eef0dd2b67b268b520a40bb440bb78a0ad77b11e7fd2ee16b2c35ce6485
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
