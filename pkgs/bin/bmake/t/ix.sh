{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20250404.tar.gz
sha:392a67e2c4b685f0afa6da886b551ad0b77644c7b622d5b07fb2144530e90376
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
