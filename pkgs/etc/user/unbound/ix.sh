{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user(userid=101,user=unbound,hash=x)
{% endblock %}
