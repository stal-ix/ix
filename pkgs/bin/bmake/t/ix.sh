{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20241124.tar.gz
sha:4f66406091c2f85ea964b238d69eb8f71ab4baac9dca4687a71883ba6de4ddb2
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
