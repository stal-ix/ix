{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wireshark/tui
bin/wireshark/sudo
bin/wireshark/gui(allocator=tcmalloc)
{% endblock %}
