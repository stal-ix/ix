{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20251111
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
45a3f8515677ba8f3933d8213f4bb611a5c3c88380be2e46222fa44709506060
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
