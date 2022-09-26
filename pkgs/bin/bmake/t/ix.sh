{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220924.tar.gz
sha:6e6c75e822ce30d470258fb4eec5fe6eb706aea36ef0b141e7e0852c13c706bb
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
