{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sway/fx/unwrap(allocator={{default_allocator}})
{% endblock %}
