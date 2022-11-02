{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.67.tar.gz
sha:3086939ee6407516c59b0ba3fbf555338f9d52f459bcab6337c0f00e91ea8456
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/openssl
{% endblock %}
