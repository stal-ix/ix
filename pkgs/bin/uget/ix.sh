{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/uget/unwrap
bin/xdg/er(wrap=uget-gtk)
{% endblock %}
