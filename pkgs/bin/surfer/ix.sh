{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webkitproc
bin/surfer/unwrap(gtk_ver=3)
bin/xdg/er/webkit(wrap=surfer)
{% endblock %}
