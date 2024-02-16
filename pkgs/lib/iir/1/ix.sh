{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/berndporr/iir1/archive/refs/tags/1.9.4.tar.gz
sha:67d0982356f33fd37522e4711cda12f70a981a9c83de332386f89de3d7601d2b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
