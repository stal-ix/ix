{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=105,user=dnsmasq)
{% endblock %}
