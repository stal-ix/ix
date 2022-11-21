{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gettext/unwrap
bin/xdg/wrapper(wrap=poedit)
bin/poedit/unwrap(allocator=tcmalloc)
{% endblock %}
