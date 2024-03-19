{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nologin(userid=1,user=audio)
{% endblock %}
