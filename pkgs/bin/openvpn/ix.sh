{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sudo/wrapper(wrap=openvpn)
bin/openvpn/unwrap
{% endblock %}
