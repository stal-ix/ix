{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/epiphany/unwrap(gtk_ver=3,allocator=tcmalloc)
{% endblock %}
