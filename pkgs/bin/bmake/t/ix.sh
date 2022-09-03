{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220901.tar.gz
sha:3f67c575ee9ae443a5f589a40acac0163743da98cb50afd1144b4246cd5063ad
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
