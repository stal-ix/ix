{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdns/runit
bin/mdns/dns/runit
bin/dns/masq/runit
{% endblock %}
