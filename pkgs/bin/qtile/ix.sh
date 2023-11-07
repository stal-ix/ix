{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/session
bin/qtile/scripts
bin/dbus/session/runner(prog=qtilewm)
bin/qtile/unwrap(python_ver=12)
{% endblock %}
