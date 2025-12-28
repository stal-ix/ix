{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
memcached
{% endblock %}

{% block version %}
1.6.40
{% endblock %}

{% block fetch %}
https://memcached.org/files/memcached-{{self.version().strip()}}.tar.gz
a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd
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
