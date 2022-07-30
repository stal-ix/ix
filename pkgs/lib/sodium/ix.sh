{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jedisct1/libsodium/archive/refs/tags/1.0.18.tar.gz
sha:d59323c6b712a1519a5daf710b68f5e7fde57040845ffec53850911f10a5d4f4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
