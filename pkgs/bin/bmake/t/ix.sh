{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20260912
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
b6bd32964cbe451be2838822c9d200b7c7e76a2a5947c03feb71dc6bd72988bd
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
