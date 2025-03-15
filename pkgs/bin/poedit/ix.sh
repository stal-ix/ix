{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gettext/unwrap
bin/xdg/er(wrap=poedit)
bin/poedit/unwrap(allocator={{default_allocator}})
{% endblock %}
