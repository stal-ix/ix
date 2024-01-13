{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/quaternion/unwrap
org/freedesktop/secrets
{% endblock %}
