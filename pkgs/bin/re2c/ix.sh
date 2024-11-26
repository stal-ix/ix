{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/4.0.1.tar.gz
sha:f8a0192af88cedd1cf2e1f5f7859118018971b87836fcaae230da0b2ffc60af1
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
