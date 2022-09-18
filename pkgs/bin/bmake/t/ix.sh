{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220909.tar.gz
sha:34e9704a93fc183e3f1d87a81f9eabeba3200052f57fed4a751a5968d6b70225
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
