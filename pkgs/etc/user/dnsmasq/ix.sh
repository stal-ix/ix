{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user(userid=104,user=dnsmasq,hash=x)
{% endblock %}
