{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/respawn/unwrap(bumpalloc_buf=10000)
{% endblock %}
