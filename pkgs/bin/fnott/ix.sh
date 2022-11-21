{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fnott/unwrap
bin/xdg/er(wrap=fnott)
{% endblock %}
