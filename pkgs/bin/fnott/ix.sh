{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fnott/unwrap
bin/xdg/wrapper(wrap=fnott)
{% endblock %}
