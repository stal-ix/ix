{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230120.tar.gz
sha:4ff625a10471bf15ee512146462e052d7cb380c31ab28b1623d35b6b0160534a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
