{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webkitproc
bin/webview/unwrap(gtk_ver=3,allocator=tcmalloc)
{% endblock %}
