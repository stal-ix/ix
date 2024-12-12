{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.dest-unreach.org/socat/download/socat-1.8.0.2.tar.gz
sha:e9498367cb765d44bb06be9709c950f436b30bf7071a224a0fee2522f9cbb417
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/readline
{% endblock %}
