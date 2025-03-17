{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20250308.tar.gz
sha:2388d9fb186576633aa725ff163552a5dba7a6a375a8cb9a9014ab57ee7d99a2
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
