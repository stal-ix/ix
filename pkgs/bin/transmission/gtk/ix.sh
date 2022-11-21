{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/transmission
bin/transmission/gtk/unwrap
bin/xdg/wrapper(wrap=transmission-gtk)
{% endblock %}
