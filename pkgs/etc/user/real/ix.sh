{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user(login_shell=/bin/session)
{% endblock %}
