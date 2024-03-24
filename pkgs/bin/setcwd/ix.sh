{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/setcwd/unwrap(bumpalloc_buf=10000)
{% endblock %}
