{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/evince/unwrap
bin/xdg/er(wrap=evince)
{% endblock %}
