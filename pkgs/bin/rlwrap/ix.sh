{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hanslub42/rlwrap/archive/refs/tags/0.46.1.tar.gz
sha:c537e8a53df36f1f996601d776203478ad56fab1d67b3c1a63057badb0851cec
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}
