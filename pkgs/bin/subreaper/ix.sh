{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/subreaper/unwrap(bumpalloc_buf=10000)
{% endblock %}
