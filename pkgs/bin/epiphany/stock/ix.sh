{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/epiphany/{{gtk_ver}}(allocator=tcmalloc)
{% endblock %}
