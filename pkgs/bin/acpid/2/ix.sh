{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/acpid2/acpid-2.0.34.tar.xz
sha:2d095c8cfcbc847caec746d62cdc8d0bff1ec1bc72ef7c674c721e04da6ab333
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
