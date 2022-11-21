{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sfwbar/unwrap
bin/xdg/wrapper(wrap=sfwbar)
{% endblock %}
