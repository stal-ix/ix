{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wireshark/tui
bin/sudo/wrapper(wrap=tshark)
bin/sudo/wrapper(wrap=dumpcap)
bin/wireshark/gui(allocator=tcmalloc)
{% endblock %}
