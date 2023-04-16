{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=100,user=nobody)
{% endblock %}
