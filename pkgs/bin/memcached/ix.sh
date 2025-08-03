{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
memcached
{% endblock %}

{% block version %}
1.6.39
{% endblock %}

{% block fetch %}
https://memcached.org/files/memcached-{{self.version().strip()}}.tar.gz
23e5507e933b15463161d4c5d3921b0c5f340b542d6edd7f6c5e17c34f11a363
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
