{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/evince/3
bin/xdg/er(wrap=evince)
{% endblock %}
