{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
taglib
{% endblock %}

{% block version %}
2.0.2
{% endblock %}

{% block fetch %}
https://taglib.org/releases/taglib-{{self.version().strip()}}.tar.gz
0de288d7fe34ba133199fd8512f19cc1100196826eafcb67a33b224ec3a59737
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/utf8/cpp
{% endblock %}
