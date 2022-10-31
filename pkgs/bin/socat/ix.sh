{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.dest-unreach.org/socat/download/socat-1.7.4.4.tar.gz
sha:0f8f4b9d5c60b8c53d17b60d79ababc4a0f51b3bb6d2bd3ae8a6a4b9d68f195e
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/readline
{% endblock %}
