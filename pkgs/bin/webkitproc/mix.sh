{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/webkitproc/unwrap(allocator=tcmalloc)
{% endblock %}
