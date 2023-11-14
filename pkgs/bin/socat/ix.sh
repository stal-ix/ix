{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.dest-unreach.org/socat/download/socat-1.8.0.0.tar.gz
sha:6010f4f311e5ebe0e63c77f78613d264253680006ac8979f52b0711a9a231e82
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/readline
{% endblock %}
