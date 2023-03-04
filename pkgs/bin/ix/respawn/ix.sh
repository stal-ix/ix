{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/respawn/unwrap(allocator=bumpalloc,bumpalloc_buf=100000)
{% endblock %}
