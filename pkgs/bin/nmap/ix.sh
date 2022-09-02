{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://nmap.org/dist/nmap-7.93.tar.bz2
sha:55bcfe4793e25acc96ba4274d8c4228db550b8e8efd72004b38ec55a2dd16651
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/pcre
lib/linux
lib/ssh/2
lib/linear
lib/openssl
{% endblock %}
