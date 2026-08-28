{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20260714
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
0810781d24ad6efe010a8ce91c5c529dc8dd95a561d6c93b30e56b8d679cce65
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
