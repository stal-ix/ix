{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user(hash=x,login_shell=/bin/nologin)
{% endblock %}
