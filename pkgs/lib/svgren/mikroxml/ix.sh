{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
mikroxml
{% endblock %}

{% block version %}
0.1.58
{% endblock %}

{% block fetch %}
https://github.com/cppfw/mikroxml/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:1ff6b8c677b6de0838c5ad97d7cf83042345ce4d6d97d914ee082c1c9f9544bc
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/utki
{% endblock %}
