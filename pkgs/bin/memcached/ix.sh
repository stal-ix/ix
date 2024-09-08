{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://memcached.org/files/memcached-1.6.31.tar.gz
sha:20d8d339b8fb1f6c79cee20559dc6ffb5dfee84db9e589f4eb214f6d2c873ef5
{% endblock %}

{% block bld_libs %}
lib/c
lib/event
{% endblock %}

{% block patch %}
# incoherent NDEBUG usage
echo 'int cache_error = 0;' >> cache.c
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
