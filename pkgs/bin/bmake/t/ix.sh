{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240602.tar.gz
sha:44a0f7b0cecd71dc43a03c8fd5eda6d159e0d7e1302f669cc03203e75dde7b9b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
