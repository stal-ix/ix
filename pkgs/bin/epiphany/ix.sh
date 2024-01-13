{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/epiphany/unwrap(gtk_ver=4)
org/freedesktop/secrets
org/freedesktop/portal/desktop
{% endblock %}
