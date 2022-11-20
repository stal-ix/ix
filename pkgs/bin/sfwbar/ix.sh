{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sfwbar/unwrap
bin/xdg/wrapper(name=sfwbar)
{% endblock %}
