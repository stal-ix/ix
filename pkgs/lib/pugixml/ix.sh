{% extends '//die/c/cmake.sh' %}

{% block fetch %}
http://github.com/zeux/pugixml/releases/download/v1.13/pugixml-1.13.tar.gz
sha:40c0b3914ec131485640fa57e55bf1136446026b41db91c1bef678186a12abbe
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
