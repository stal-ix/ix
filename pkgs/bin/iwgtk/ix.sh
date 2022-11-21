{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iwgtk/unwrap
bin/xdg/wrapper(wrap=iwgtk)
{% endblock %}
