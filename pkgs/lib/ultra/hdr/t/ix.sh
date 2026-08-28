{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libultrahdr
{% endblock %}

{% block version %}
2.0.2
{% endblock %}

{% block fetch %}
https://github.com/google/libultrahdr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
aa8d193bb887c348c419780511dd03b374f4e07af8812b6d3f80c8537cf1ef2c
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}
