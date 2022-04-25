{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/foot/unwrap(allocator=tcmalloc)
{% endblock %}
