{% extends '//die/c/make.sh' %}

{% block version %}
0.6.23c
{% endblock %}

{% block pkg_name %}
empty
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/empty/empty/empty-{{self.version().strip()}}/empty-{{self.version().strip()}}.tgz
sha:8a7ca8c7099dc6d6743ac7eafc0be3b1f8991d2c8f20cf66ce900c7f08e010bd
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
