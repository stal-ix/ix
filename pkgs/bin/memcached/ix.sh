{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
memcached
{% endblock %}

{% block version %}
1.6.45
{% endblock %}

{% block fetch %}
https://memcached.org/files/memcached-{{self.version().strip()}}.tar.gz
d362c64e6d8d5287153501eabf7c85b4a761432fbf53f5d7b085d0bb1653c1dd
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
