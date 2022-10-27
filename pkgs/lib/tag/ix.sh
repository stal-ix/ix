{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://taglib.org/releases/taglib-1.13.tar.gz
sha:58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
