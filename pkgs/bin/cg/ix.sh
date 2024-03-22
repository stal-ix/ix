{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/cg/unwrap(bumpalloc_buf=10000)
{% endblock %}
