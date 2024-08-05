{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mutter/unwrap
bin/xdg/er(wrap=mutter)
{% endblock %}
