{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/freerdp/unwrap(libsdl_ver=3)
{% endblock %}
