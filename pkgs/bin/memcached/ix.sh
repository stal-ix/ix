{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://memcached.org/files/memcached-1.6.19.tar.gz
sha:2fd48b047146398b073a588e97917d9bc908ce51978580d8e0bedaa123b4c70d
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
