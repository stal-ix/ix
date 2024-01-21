{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=106,user=greeter)
{% endblock %}
