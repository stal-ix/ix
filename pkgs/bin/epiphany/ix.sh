{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/shepherd
bin/webkitproc
bin/epiphany/unwrap(gtk_ver=4,allocator=tcmalloc)
{% endblock %}
