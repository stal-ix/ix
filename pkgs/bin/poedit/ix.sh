{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gettext/unwrap
bin/poedit/unwrap(allocator=tcmalloc)
{% endblock %}
