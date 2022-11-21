{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sfwbar/unwrap
bin/xdg/er(wrap=sfwbar)
{% endblock %}
