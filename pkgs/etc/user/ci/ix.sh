{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=104,user=ci)
{% endblock %}
