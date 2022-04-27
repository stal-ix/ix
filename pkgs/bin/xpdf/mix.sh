{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/xpdf/tools
bin/xpdf/viewer(allocator=tcmalloc)
{% endblock %}
