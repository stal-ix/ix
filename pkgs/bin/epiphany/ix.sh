{% extends '//die/hub.sh' %}

{% block run_deps %}
org/freedesktop/secrets
org/freedesktop/portal/desktop
bin/epiphany/unwrap(gtk_ver=4)
{% endblock %}
