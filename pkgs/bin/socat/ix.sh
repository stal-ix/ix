{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.dest-unreach.org/socat/download/socat-1.8.0.3.tar.gz
sha:a9f9eb6cfb9aa6b1b4b8fe260edbac3f2c743f294db1e362b932eb3feca37ba4
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/readline
{% endblock %}
