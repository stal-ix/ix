{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://memcached.org/files/memcached-1.6.17.tar.gz
sha:2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224
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
