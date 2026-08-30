{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libmatroska
{% endblock %}

{% block version %}
1.7.2
{% endblock %}

{% block fetch %}
https://github.com/Matroska-Org/libmatroska/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
ef1104f1d77971ac95a33ae6184656fc5ddb51232ca542c31c31daaa493fe204
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/ebml
{% endblock %}
