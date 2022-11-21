{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iwgtk/unwrap
bin/xdg/er(wrap=iwgtk)
{% endblock %}
