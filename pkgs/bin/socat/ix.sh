{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
socat
{% endblock %}

{% block version %}
1.8.1.3
{% endblock %}

{% block fetch %}
http://www.dest-unreach.org/socat/download/socat-{{self.version().strip()}}.tar.gz
06602ffd591e98c75b3dc1d66f0f19136cc666b0b2d95caad987d6ab2cb28097
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/readline
{% endblock %}
