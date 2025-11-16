{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/timeout/unwrap(bumpalloc_buf=100000)
{% endblock %}
