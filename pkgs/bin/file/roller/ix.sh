{% extends '//die/hub.sh' %}

{% block run_deps %}
set/compress
org/freedesktop/portal/desktop
bin/file/roller/unwrap(gtk_ver=4)
bin/xdg/er(wrap=file-roller)
{% endblock %}
