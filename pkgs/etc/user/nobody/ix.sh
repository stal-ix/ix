{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user(userid=100,user=nobody,hash=x)
{% endblock %}
