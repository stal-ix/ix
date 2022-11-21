{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sudo/er(wrap=openvpn)
bin/openvpn/unwrap
{% endblock %}
