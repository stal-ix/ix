{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fuzzel/unwrap
bin/xdg/er(wrap=fuzzel)
{% endblock %}
