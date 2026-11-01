{% extends '//bin/coreutils/9/4/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.10
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
e0bde1fb68509447fc723cf2517e8a8c7fa46769919bb7490ed350a2e9238562
{% endblock %}
