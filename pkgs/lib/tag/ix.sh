{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://taglib.org/releases/taglib-2.0.2.tar.gz
sha:0de288d7fe34ba133199fd8512f19cc1100196826eafcb67a33b224ec3a59737
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/utf8/cpp
{% endblock %}
