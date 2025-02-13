{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ruff/unwrap(allocator=jemalloc)
{% endblock %}
