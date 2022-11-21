{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/pcmanfm/unwrap
bin/xdg/er(wrap=pcmanfm)
{% endblock %}
