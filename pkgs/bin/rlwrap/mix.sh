{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/hanslub42/rlwrap/archive/refs/tags/v0.45.2.tar.gz
sha:7197559f193918cc8782421b5b1313abbde5e3b965a5f91f9ee25aee9b172ec5
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}
