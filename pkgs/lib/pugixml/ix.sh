{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pugixml
{% endblock %}

{% block version %}
1.16
{% endblock %}

{% block fetch %}
http://github.com/zeux/pugixml/releases/download/v{{self.version().strip()}}/pugixml-{{self.version().strip()}}.tar.gz
4cee1ca4aad395170f4c7a07824f3bdd41f28316c6e1e1090a1425b278ec0b4b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
