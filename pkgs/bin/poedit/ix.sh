{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gettext
bin/poedit/unwrap(allocator=tcmalloc)
{% endblock %}
