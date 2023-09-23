{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/reddit/desktop/unwrap(libcplpl_ver=17)
{% endblock %}
