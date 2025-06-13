{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
c-list
{% endblock %}

{% block version %}
3.1.0
{% endblock %}

{% block fetch %}
https://github.com/c-util/c-list/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7d5b12166859bd729404cba8da575ae47952cbb97d650c5bbe50559c03631e4b
{% endblock %}

{% block lib_deps %}
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
