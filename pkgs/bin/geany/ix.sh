{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/geany/unwrap
bin/xdg/er(wrap=geany)
{% endblock %}
