{% extends 't/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/svgren/archive/refs/tags/0.6.2.tar.gz
sha:277ce8771944f82540824b25126c5d6a0ef399a9a0b123282a9675a074ffd774
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/dom
lib/svgren/agg
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}
