{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnome/text/editor/unwrap
bin/xdg/wrapper(name=gnome-text-editor)
{% endblock %}
