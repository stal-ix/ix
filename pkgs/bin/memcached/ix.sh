{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://memcached.org/files/memcached-1.6.35.tar.gz
sha:eb4529317eec818efc44352ddd1f959fd20882bed1ae292a5788bd7a4966f7c1
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
