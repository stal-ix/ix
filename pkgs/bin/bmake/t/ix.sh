{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20250125.tar.gz
sha:4c7db7d04dbbfad00e57adc750cdd183095cc494bbeaf9daf338415cb5a599b2
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
