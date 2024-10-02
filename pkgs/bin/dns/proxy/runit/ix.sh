{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dns/proxy
etc/user/dnsproxy
bin/dns/proxy/runit/script(srv_deps=bin/dns/proxy,srv_dir=dnsproxy)
{% endblock %}
