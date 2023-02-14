{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/papki/archive/refs/tags/1.0.122.tar.gz
sha:f47cb6c5ac2f5fae951f95b89bca196ce7889b912a1acfd31f866808aa4ef77c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/svgren/utki
{% endblock %}
