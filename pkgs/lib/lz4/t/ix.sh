{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lz4
{% endblock %}

{% block version %}
1.11.1
{% endblock %}

{% block fetch %}
https://github.com/lz4/lz4/archive/refs/tags/v{{self.version().strip()}}.tar.gz
683fed08a844ad012196381e40badf80c0bbe4962959761416d41c9e67d77ec7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
