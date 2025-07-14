{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
iir1
{% endblock %}

{% block version %}
1.10.0
{% endblock %}

{% block fetch %}
https://github.com/berndporr/iir1/archive/refs/tags/{{self.version().strip()}}.tar.gz
13b53f14d276adf6cafd3564fcda1d4b3e72342108d1c40ec4b4f0c7fc3ac95a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
