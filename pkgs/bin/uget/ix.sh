{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/uget/unwrap
bin/xdg/wrapper(wrap=uget-gtk)
{% endblock %}
