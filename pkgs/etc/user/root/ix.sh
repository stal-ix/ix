{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user(userid=0,user=root,login_shell=/bin/sh,hash=x)
{% endblock %}
