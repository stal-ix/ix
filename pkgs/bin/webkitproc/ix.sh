{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webkitproc/unwrap(allocator=tcmalloc)
{% endblock %}
