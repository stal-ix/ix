{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
socat
{% endblock %}

{% block version %}
1.8.0.3
{% endblock %}

{% block fetch %}
http://www.dest-unreach.org/socat/download/socat-{{self.version().strip()}}.tar.gz
a9f9eb6cfb9aa6b1b4b8fe260edbac3f2c743f294db1e362b932eb3feca37ba4
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/readline
{% endblock %}
