{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/uget/unwrap
bin/xdg/wrapper(name=uget-gtk)
{% endblock %}
