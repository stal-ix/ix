{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/Matroska-Org/libmatroska/archive/refs/tags/release-1.6.3.tar.gz
sha:0c8c875ae26ac69a722f7fd0f4a4fecb4fdff681f2a165f09c06a40cbf1d0de6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/ebml
{% endblock %}
