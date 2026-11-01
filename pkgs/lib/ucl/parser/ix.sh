{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libucl
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block fetch %}
https://github.com/vstakhov/libucl/archive/refs/tags/{{self.version().strip()}}.tar.gz
3e27a97d48561aa262f93715ad5b483dceca02b033662b9a5a29c36f48b518e7
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
