{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/notify/send
bin/foot/unwrap(allocator=tcmalloc)
{% endblock %}
