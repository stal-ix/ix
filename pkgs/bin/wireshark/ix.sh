{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wireshark/tui
bin/wireshark/gui(allocator=tcmalloc)
{% endblock %}
