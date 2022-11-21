{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/evince/unwrap
bin/xdg/wrapper(wrap=evince)
{% endblock %}
