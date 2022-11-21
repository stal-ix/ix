{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webkitproc
bin/xdg/wrapper/webkit(name=webview)
bin/webview/unwrap(gtk_ver=3,allocator=tcmalloc)
{% endblock %}
