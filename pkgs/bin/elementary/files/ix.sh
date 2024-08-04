{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xdg/er(wrap=io.elementary.files)
bin/elementary/files/unwrap(gtk_ver=3)
{% endblock %}
