{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if mingw32 %}
bin/ruff/unwrap(force_allocator=mimalloc/1)
{% elif linux %}
bin/ruff/unwrap(force_allocator=jemalloc)
{% else %}
bin/ruff/unwrap
{% endif %}
{% endblock %}
