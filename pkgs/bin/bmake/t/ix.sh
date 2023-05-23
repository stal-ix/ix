{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230522.tar.gz
sha:dfe556df70e1555b70eccf4e6d367aa8b91aa076d5e9b55e36b5ce3e721f9050
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
