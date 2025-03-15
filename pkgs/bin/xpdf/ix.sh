{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xpdf/tools
bin/xpdf/viewer(allocator={{default_allocator}})
{% endblock %}
