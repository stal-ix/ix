{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://memcached.org/files/memcached-1.6.15.tar.gz
sha:8d7abe3d649378edbba16f42ef1d66ca3f2ac075f2eb97145ce164388e6ed515
{% endblock %}

{% block bld_libs %}
lib/c
lib/event
{% endblock %}
