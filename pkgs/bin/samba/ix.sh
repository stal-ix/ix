{% extends '//die/wafbase.sh' %}

{% block fetch %}
https://download.samba.org/pub/samba/stable/samba-4.16.3.tar.gz
sha:7a6565d7c0a98eac7a5a283fa94d9266dd39ea62f262ccdc5a634a580d549c58
{% endblock %}

{% block bld_libs %}
lib/c
lib/aio
lib/cap
lib/uring
lib/gpgme
lib/gnutls
lib/jansson
lib/readline
lib/ini/parser
lib/bsd/overlay
{% endblock %}

{% block waf %}buildtools/bin/waf{% endblock %}
