{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20250225.tar.gz
sha:cc19b15438b454e334a23a8c91e3b87fd4b8be08c6fd9500d48e55cc683bba10
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
