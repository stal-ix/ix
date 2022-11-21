{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fsearch/unwrap
bin/xdg/wrapper(name=fsearch)
{% endblock %}
