{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if mingw32 %}
bin/ruff/unwrap(force_allocator=mimalloc/1)
{% else %}
bin/ruff/unwrap(force_allocator=jemalloc)
{% endif %}
{% endblock %}
