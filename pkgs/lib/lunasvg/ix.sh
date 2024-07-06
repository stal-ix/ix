{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v2.4.0.tar.gz
sha:0682c60501c91d75f4261d9c1a5cd44c2c9da8dba76f8402eab628448c9a4591
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
