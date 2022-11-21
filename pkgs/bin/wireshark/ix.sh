{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wireshark/tui
bin/sudo/er(wrap=tshark)
bin/sudo/er(wrap=dumpcap)
bin/xdg/er(wrap=wireshark)
bin/wireshark/gui(allocator=tcmalloc)
{% endblock %}
