{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dns/masq/unwrap(lua_ver=puc/5/2)
{% endblock %}
