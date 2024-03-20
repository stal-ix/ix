{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240314.tar.gz
sha:f9a906d7487699c9e0d2c135700c2d088da5fcd0f2f6761267a57aabfea31feb
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
