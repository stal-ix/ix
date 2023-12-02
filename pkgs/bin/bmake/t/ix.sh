{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20231124.tar.gz
sha:6453bde27880d384f20b9c3e05c33647e706d67ed385d48856783fb56120c530
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
