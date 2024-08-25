{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.dest-unreach.org/socat/download/socat-1.8.0.1.tar.gz
sha:dc350411e03da657269e529c4d49fe23ba7b4610b0b225c020df4cf9b46e6982
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/readline
{% endblock %}
