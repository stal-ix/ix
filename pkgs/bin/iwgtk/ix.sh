{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iwgtk/unwrap
bin/xdg/wrapper(name=iwgtk)
{% endblock %}
