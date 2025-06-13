{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pugixml
{% endblock %}

{% block version %}
1.15
{% endblock %}

{% block fetch %}
http://github.com/zeux/pugixml/releases/download/v{{self.version().strip()}}/pugixml-{{self.version().strip()}}.tar.gz
655ade57fa703fb421c2eb9a0113b5064bddb145d415dd1f88c79353d90d511a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
