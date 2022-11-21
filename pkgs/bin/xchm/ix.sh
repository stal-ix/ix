{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xchm/unwrap
bin/xdg/wrapper(name=xchm)
{% endblock %}
