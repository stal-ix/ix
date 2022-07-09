{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/BLAKE2/libb2/archive/refs/tags/v0.98.1.tar.gz
sha:10053dbc2fa342516b780a6bbf6e7b2a2360b8d49c5ac426936bf3df82526732
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-native
--enable-fat
{% endblock %}
