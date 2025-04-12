{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.6.38
{% endblock %}

{% block fetch %}
https://memcached.org/files/memcached-{{self.version().strip()}}.tar.gz
sha:334d792294e37738796b5b03375c47bb6db283b1152e2ea4ccb720152dd17c66
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
