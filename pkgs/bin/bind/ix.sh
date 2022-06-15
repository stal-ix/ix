{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bind/unwrap(allocator=jemalloc)
{% endblock %}
