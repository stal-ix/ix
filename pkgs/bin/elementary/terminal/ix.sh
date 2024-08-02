{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xdg/er(wrap=io.elementary.terminal)
bin/elementary/terminal/unwrap(gtk_ver=3)
{% endblock %}
