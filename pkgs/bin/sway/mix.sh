{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/sway/bg
bin/sway/idle
bin/sway/tools
bin/sway/compositor(allocator=tcmalloc)
{% endblock %}
