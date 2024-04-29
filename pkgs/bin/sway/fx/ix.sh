{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sway/fx/unwrap(allocator=tcmalloc)
{% endblock %}
