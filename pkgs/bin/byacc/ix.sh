{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-20230201.tgz
sha:576cc9d9ae5e22503ed5e3582498cf2cccacef401969106420547b4d05c87d76
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
