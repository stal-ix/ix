{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dnsmasq/unwrap(lua_ver=puc/5/2)
{% endblock %}
