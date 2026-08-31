{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
9.1.0
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
24e3510a4c95a9e6eb0fb4a27eea650d13773231cbd8b564ed9670aa5484d193
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
