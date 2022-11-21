{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fsearch/unwrap
bin/xdg/er(wrap=fsearch)
{% endblock %}
