{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnome/text/editor/unwrap
bin/xdg/wrapper(wrap=gnome-text-editor)
{% endblock %}
