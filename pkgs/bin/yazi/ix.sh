{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/yazi/unwrap(allocator=jemalloc)
{% endblock %}
